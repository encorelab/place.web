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
		// calculate concept connection votes score
		if ($_SESSION['profile'] == 'TEACHER'){
			$this->view->commentScore = Vote::calculateCommentScore();
			list($tagExampleScore, $tagQuestionScore, $tagScoreTot) = Vote::calculateTagScore();
		}else{
			$this->view->commentScore = Vote::calculateCommentScore($_SESSION['author_id']);
			list($tagExampleScore, $tagQuestionScore, $tagScoreTot) = Vote::calculateTagScore($_SESSION['author_id']);
		}
		
		$this->view->tagExampleScore = $tagExampleScore;
		$this->view->tagQuestionScore = $tagQuestionScore;
		$this->view->tagScore = $tagScoreTot;
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

	public function curriculumJournalAction(){
		Placeweb_Authorizer::authorize("TEACHER");
        $this->view->logs = Doctrine::getTable("AssessmentReviews")->findByDql("run_id = ".$_SESSION["run_id"]." AND author_id = ".$_SESSION['author_id']);
	}
	
	public function saveJournalEntryAction(){
		$params = $this->getRequest()->getParams();
		
		$comment = $params['comment'];
		
		if ($comment != ''){
			$assessmentReview = new AssessmentReviews();
			$assessmentReview->run_id = $_SESSION['run_id'];
			$assessmentReview->author_id = $_SESSION['author_id'];			
			$assessmentReview->log = $comment;
			$assessmentReview->date_created = date('Y-m-d H:i:s');
			$assessmentReview->save();			
		}
				
		$this->_forward('curriculum-journal');
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

