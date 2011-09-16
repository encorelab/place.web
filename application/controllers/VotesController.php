<?php
class VotesController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
        
    }
    
    public function showAction()
    {
	// this will be called throught ajax

    	
    } // end showAction()
        
	public function addAction()
	{
    	global $PLACEWEB_CONFIG;
    	$params = $this->getRequest()->getParams();
		
    	// disableLayout
    	$this->_helper->layout()->disableLayout();
    	
    	//echo "<hr/>checking if user has voted";
		// prevent double votting
		$allowVote = false;
	
		if(isset($params['vote_obj_id']))
		{
			// check the votting status
			$allowVote = $this->checkVoteStatus($_SESSION['run_id'], $_SESSION['author_id'], $params['vote_obj_id'], $params['vote_obj_type']);
			
			if(!$allowVote)
			{
				echo "<script>alert('You have already voted');</script>";
			}
			
			//print_r($params);
		} else {
			echo "Waiting for votes";
		}
		
		// this values have been hard-coded in the table commentable
		//if($params['vote_obj_id']==1)
		if($allowVote)
		{
    		echo "<hr/>adding vote";
			
	        //if($params['saved'])
	        
	        print_r($params);


	    $vote = new Vote();           
		$vote->run_id = $_SESSION['run_id'];
		$vote->author_id = $_SESSION['author_id'];
		$vote->date_created = date( 'Y-m-d H:i:s');
	
		$vote->obj_id = $params['vote_obj_id']; // the entity on which the vote is added (example_concept, question_concept)
		$vote->obj_type = $params['vote_obj_type']; // be sure this is set in the page submiting data (hard-coded)
		$vote->vote_value = $params['vote_value'];

		$vote->save();
		
        
		//echo "<hr>Vote Id: ".$vote->id;
		//print_r($vote);
///*		  
	        
		// insert activity log
		$activity = new Activity();
		$activity->run_id = $_SESSION['run_id'];
		$activity->author_id = $_SESSION['author_id'];
		//$question_comment->date_modified = date( 'Y-m-d H:i:s');
		$activity->date_created = date( 'Y-m-d H:i:s');
	
		$activity->activity_type_id = $params['vote_activity_type_id'];
		
		// optional: not realy used now?
		if(isset($params['activity_on_user']))
		{
			$activity->activity_on_user = $params['vote_activity_on_user'];
		}
		$activity->i1 = $params['vote_i1']; // save here the id that provides the entry point, (example or question id) this needed for the feed
		$activity->i2 = $params['vote_i2']; // save here the id of the entity on which the vote is added (comment, example_concept, question_concept) 
		$activity->i3 = "";
		$activity->i4 = "";
		$activity->i5 = "";
		$activity->s1 = "";
		$activity->s2 = "";
		$activity->s3 = "";
		$activity->t1 = $params['vote_t1'];
		$activity->t2 = $params['vote_t2'];
	
		$activity->save();
		
		//echo "<br>activity Id: ".$activity->id;
//*/
	     	
		// redirect 
			//header('Location: '.$_SERVER['HTTP_REFERER']);
			
		} // end if allow vote	

	} // end addAction()
     
	private function checkVoteStatus($run_id, $author_id, $obj_id, $obj_type)
	{
		/*
	1 comments
	2 answers
	3 answer_concept
	4 example_concept
		 */
		echo "<hr>Check votting status";
		/*
		 * v votable
		 * a vote
		 * t 
		 */
		$q = Doctrine_Query::create()
			->select ("v.*")
			->from("Vote v")
//			->innerJoin("v.User u")
			->where('v.run_id = ? AND v.author_id = ? AND v.obj_id = ? AND v.obj_type = ?' , 
			array($run_id, $author_id, $obj_id, $obj_type))					
			->orderBy('v.id DESC');
		$vote = $q->fetchArray();

		print_r($vote);
		
		if(count($vote)==0)
		{
			return true;
		} else {
			return false;
		} 
		

		

	} // end checkVoteStatus()

} // end class

