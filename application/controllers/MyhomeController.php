<?php

class MyhomeController extends Zend_Controller_Action
{

    public function init()
    {
		Placeweb_Authorizer::authorize();
    }

    public function indexAction()
    {
    	// calculate comment vote score
    	$this->view->commentScore = $this->calculateCommentScore();
    	
    	// calculate concept connection votes score
    	$this->view->tagScore = $this->calculateTagScore();
    	
    }
    
    public function calculateCommentScore(){
        // get all user's comments
        $comments = Doctrine::getTable("Comment")
                    ->findByDql("author_id = ? AND run_id = ?", array($_SESSION['author_id'], $_SESSION['run_id']));
                            
        $commentIds = array();
        foreach ($comments as $comment){
            $commentIds[] = $comment->id;
        }
        
        if (count($comments) == 0){
            return 0;
        }
        
        // sum up all the votes for the user comments found
        $votes = Doctrine_Query::create()
                    ->select("sum(vote_value) as vote_sum")
                    ->from("Vote")
                    ->whereIn("obj_id", $commentIds)
                    ->andWhere("obj_type = ?", Votable::$COMMENT)
                    ->execute();

        if (count($votes) == 0 || $votes[0]['vote_sum']==0){
            return 0;
        } else {
        	return $votes[0]['vote_sum'];
        }
        //return $votes[0]['vote_sum'];
    }
    

    
    public function calculateTagScore(){
        // get all user's QuestionConcept
        $questionConcepts = Doctrine::getTable("QuestionConcept")
                    ->findByDql("author_id = ? AND run_id = ?", array($_SESSION['author_id'], $_SESSION['run_id']));
        
        $questionConceptIds = array();
        
        foreach ($questionConcepts as $questionConcept){
            $questionConceptIds[] = $questionConcept->id;
            //echo "<hr>".$questionConcept->id;
        }
        
        $questionConceptScore = 0;
        
       	// Anto fixed this. note that if $questionConceptIds[]is empty, the query selects sums all the votes, this if prevents this
        if (count($questionConcepts) != 0){

        	// sum up all the votes for the user comments found
	        $votes1 = Doctrine_Query::create()
	                    ->select("sum(vote_value) as vote_sum")
	                    ->from("Vote")
	                    ->whereIn("obj_id", $questionConceptIds)
	                    ->andWhere("obj_type = ?", Votable::$QUESTION_CONCEPT)
	                    ->execute();
	
	        if (count($votes1) != 0){
	        	$questionConceptScore = $votes1[0]['vote_sum'];
	        }
        }
        
    	// get all user's ExampleConcept
        $exampleConcepts = Doctrine::getTable("ExampleConcept")
                    ->findByDql("author_id = ? AND run_id = ?", array($_SESSION['author_id'], $_SESSION['run_id']));

        $exampleConceptIds = array();
        
        foreach ($exampleConcepts as $exampleConcept){
            $exampleConceptIds[] = $exampleConcept->id;
        }
        
        $exampleConceptScore = 0;
        
        if (count($exampleConceptIds) != 0)
        {
        
	        // sum up all the votes for the user comments found
    	    $votes2 = Doctrine_Query::create()
                    ->select("sum(vote_value) as vote_sum")
                    ->from("Vote")
                    ->whereIn("obj_id", $exampleConceptIds)
                    ->andWhere("obj_type = ?", Votable::$EXAMPLE_CONCEPT)
                    ->execute();

	        if (count($votes2) != 0){
	        	$exampleConceptScore = $votes2[0]['vote_sum'];
	        }
        }

        $this->view->tagExampleScore=$exampleConceptScore;
        $this->view->tagQuestionScore=$questionConceptScore;
        $tagScoreTot = $questionConceptScore+$exampleConceptScore;

        return $tagScoreTot;
        
    }
        
    public function preferencesAction()
    {
	    global $PLACEWEB_CONFIG;
	    $params = $this->getRequest()->getParams();
	    $validate=0;
	    
	    $this->view->showPasswChangeStatus=false;
	    $this->view->showPreferencesForm=false;
	    $this->view->isOkCurrentPassw=false;
	    
	    
	    if(isset($params['validate']) && $params['validate']==1) // js validation is correct
	    {

	    	$rollcall_site_url = $PLACEWEB_CONFIG['rollCallUrl'];
	    	
	    	$pest = new PestXML($rollcall_site_url);
		    $userData = $pest->get('/users/'.$_SESSION['username'].'.xml');
		    $realPasswordSha1 = $userData->account->{'encrypted-password'};
		    
		    if($realPasswordSha1==sha1($params['current-passw']))
		    {
		    	//echo "<br/>Current password is correct";
		    	
		    	if($params['new-passw1']==$params['new-passw2'])
		    	{
			    	$userId = $userData->id;
			    	$success=$this->changePassword($userId, $params['new-passw1']);
			    	
			    	if($success)
			    	{
			    		$this->view->showPasswChangeStatus=true;
			    	} else {
			    		$this->view->showPasswChangeStatus=false;
			    	}
		    		
		    	} else {
		    		echo "<br/>The new password does not match. Please try again.";
		    		$this->view->showPreferencesForm=true;
		    	}
		    
		    } else {
		    	echo "<br>Current password is incorrect";
		    	$this->view->showPreferencesForm=true;
		    }
	    	
	    } else {
	    	$this->view->showPreferencesForm=true;
	    }
       
    }
    
    public function classlistAction()
    {
		Placeweb_Authorizer::authorize("TEACHER");
        $this->view->students = Doctrine::getTable("User")->findByDql("user_type = 'STUDENT' AND run_id = ".$_SESSION["run_id"]);
    }
    
    private function changePassword($userId, $newPassw)
    {
    	global $PLACEWEB_CONFIG;
    	
	    $rollcall_site_url = $PLACEWEB_CONFIG['rollCallUrl'];
	    $pest = new PestXML($rollcall_site_url);

    	$data = array(
		  'user' => array(
    		'account' => array(
    			'password' => $newPassw,
    		),
		  )
		);
		
		try {
		  $pest->put('/users/'.$userId.'.xml', $data);
		  //echo "<br/>User ".$userId." updated.";
		  return true;
		} catch (Pest_Exception $e) {
		  //echo "Couldn't update User ".$userId." because: ".$e->getMessage();
		  return false;
		}
    }

}

