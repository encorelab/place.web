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
    	
    	echo "<hr/>checking if user has voted";
		// prevent double votting
		$allowVote = false;
	
		// check the votting status
		$allowVote = $this->checkVoteStatus($run_id, $author_id, $obj_id, $obj_type);
    	
		if($allowVote)
		{
    		echo "<hr/>adding vote";
		}
        

			
	        //if($params['saved'])
	        
	        //print_r($params);

/*	
	    $vote = new Vote();           
		$vote->run_id = $_SESSION['run_id'];
		$vote->author_id = $_SESSION['author_id'];
		$vote->date_created = date( 'Y-m-d H:i:s');
	
		$vote->obj_id = $params['obj_id'];
		$vote->obj_type = $params['obj_type']; // be sure this is set in the page submiting data (hard-coded)
		$vote->vote_value = $params['vote_value'];
	        $vote->save();
	        
	        echo "<hr>Vote Id: ".$vote->id;
	        
		// insert activity log
		$activity = new Activity();
		$activity->run_id = $_SESSION['run_id'];
		$activity->author_id = $_SESSION['author_id'];
		//$question_comment->date_modified = date( 'Y-m-d H:i:s');
		$activity->date_created = date( 'Y-m-d H:i:s');
	
		$activity->activity_type_id = $params['activity_type_id'];
		
		// optional: not realy used now?
		if(isset($params['activity_on_user']))
		{
			$activity->activity_on_user = $params['activity_on_user'];
		}
		$activity->i1 = $params['i1'];
		$activity->i2 = $params['i2'];
		$activity->i3 = "";
		$activity->i4 = "";
		$activity->i5 = "";
		$activity->s1 = "";
		$activity->s2 = "";
		$activity->s3 = "";
		$activity->t1 = $params['t1'];
		$activity->t2 = $params['t2'];
	
		$activity->save();
		
		echo "<br>activity Id: ".$activity->id;
*/	
		// redirect 
			//header('Location: '.$_SERVER['HTTP_REFERER']);	

	} // end addAction()
     
	private function checkVoteStatus($run_id, $author_id, $obj_id, $obj_type)
	{
		echo "<hr>Check votting status";

		return false;

	} // end checkVoteStatus()

} // end class

