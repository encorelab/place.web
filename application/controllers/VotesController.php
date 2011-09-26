<?php
class VotesController extends Zend_Controller_Action
{

    public function init()
    {
		Placeweb_Authorizer::authorize();
	}

    public function indexAction()
    {
    }
    
	// called through ajax
    public function showAction()
    {    	
    } // end showAction()
        

    public function testadd()
    {
    	global $PLACEWEB_CONFIG;
    	$params = $this->getRequest()->getParams();
    	
    	print_r($params);
    	
    	// disableLayout
    	$this->_helper->layout()->disableLayout();
    		// prevent double votting
		$allowVote = false;
		
		//echo "prefix: ".$params['prefix'];
		
		if(isset($params['prefix']) && $params['prefix']!="" && isset($params[$params['prefix'].'obj_id']))
		//if(isset($params['vote_obj_id']))
		{
			// set all the internal variables 
			$prefix = $params['prefix'];
			
			$obj_id = $prefix.$params['obj_id']; 
			$ob_type = $prefix.$params['obj_type'];
			$vote_value = $prefix.$params['vote_value'];
			
			$activity_type_id = $prefix.$params['activity_type_id'];
			$activity_on_user = $prefix.$params['activity_on_user'];
			$i1 = $prefix.$params['i1'];
			$i2 = $prefix.$params['i2'];

			$t1 = $prefix.$params['t1'];
			$t2 = $prefix.$params['t2'];
			
			// check the votting status
			$allowVote = $this->checkVoteStatus($_SESSION['run_id'], $_SESSION['author_id'], 
			$obj_id, $obj_type);
			
			if(!$allowVote)
			{
				//echo "<script>alert('You have already voted');</script>";
				$this->view->error=1; // you already votted
			}

			//print_r($params);
		}
	
    }
    
    public function addAction()
	{
    	global $PLACEWEB_CONFIG;
    	$params = $this->getRequest()->getParams();
    	
    	//print_r($params);
		
    	// disableLayout
    	$this->_helper->layout()->disableLayout();
    	
    	//echo "<hr/>checking if user has voted";
		// prevent double votting
		$allowVote = false;
		
		//echo "prefix: ".$params['prefix'];
		
		if(isset($params['prefix']) && $params['prefix']!="" && isset($params[$params['prefix'].'obj_id']))
		//if(isset($params['vote_obj_id']))
		{
			// set all the internal variables 
			$prefix = $params['prefix'];
			
			$obj_id = $params[$prefix.'obj_id']; 
			$obj_type = $params[$prefix.'obj_type'];
			$vote_value = $params[$prefix.'vote_value'];
			
			$activity_type_id = $params[$prefix.'activity_type_id'];
			$activity_on_user = $params[$prefix.'activity_on_user'];
			$i1 = $params[$prefix.'i1'];
			$i2 = $params[$prefix.'i2'];

			$s1 = $params[$prefix.'s1'];
			$s2 = $params[$prefix.'s2'];

			$t1 = $params[$prefix.'t1'];
			//$t2 = $params[$prefix.'t2'];
			
			// check the votting status
			$allowVote = $this->checkVoteStatus($_SESSION['run_id'], $_SESSION['author_id'], 
			$obj_id, $obj_type);
			
			//$allowVote=false;
			
			if(!$allowVote)
			{
				//echo "<script>alert('You have already voted');</script>";
				$this->view->error=1; // you already votted
			}

			//print_r($params);
		} else {
			//echo "Waiting for votes";
		}
		
		// this values have been hard-coded in the table commentable
		//if($params['vote_obj_id']==1)
		if($allowVote)
		{
    		//echo "<hr/>adding vote";
			
	        //if($params['saved'])
	        
	        //print_r($params);


	    $vote = new Vote();           
		$vote->run_id = $_SESSION['run_id'];
		$vote->author_id = $_SESSION['author_id'];
		$vote->date_created = date( 'Y-m-d H:i:s');
		$vote->obj_id = $obj_id; // the entity on which the vote is added (example_concept, question_concept)
		$vote->obj_type = $obj_type; // be sure this is set in the page submiting data (hard-coded)
		$vote->vote_value = $vote_value;
		$vote->save();
	        
		// insert activity log
		$activity = new Activity();
		$activity->run_id = $_SESSION['run_id'];
		$activity->author_id = $_SESSION['author_id'];
		//$question_comment->date_modified = date( 'Y-m-d H:i:s');
		$activity->date_created = date( 'Y-m-d H:i:s');
		$activity->activity_type_id = $activity_type_id;
		
		//note that this may not apply to actions conducted on example_concept or question_concept
		//because it may not be relevant the author_id of the one who created the relation 
		$activity->activity_on_user = $activity_on_user;

		$activity->i1 = $i1; // the id that provides the entry point, (example or question id)
		$activity->i2 = $i2; // the entity on which the vote is added (comment, example_concept, question_concept)
		$activity->i3 = "";
		$activity->i4 = "";
		$activity->i5 = "";
		
		$activity->s1 = $s1;
		$activity->s2 = $s2;
		$activity->s3 = "";
		
		$activity->t1 = $t1;
		//$activity->t2 = $t2;
		
		$activity->save();
		
		//echo "<br>activity Id: ".$activity->id;
//*/
	     	
		// redirect 
			//header('Location: '.$_SERVER['HTTP_REFERER']);
		$this->view->json = $this->reloadVotesCount($_SESSION['run_id'], $obj_id, $obj_type, $prefix);
			
		} // end if allow vote	

	} // end addAction()
     
	private function checkVoteStatus($run_id, $author_id, $obj_id, $obj_type)
	{
		$q = Doctrine_Query::create()
			->select ("v.*")
			->from("Vote v")

			->where('v.run_id = ? AND v.author_id = ? AND v.obj_id = ? AND v.obj_type = ?' , 
			array($run_id, $author_id, $obj_id, $obj_type))					
			->orderBy('v.id DESC');
		$vote = $q->fetchArray();

		//print_r($vote);
		
		if(count($vote)==0)
		{
			//echo  "the vote already exists";
			return true;
		} else {
			//echo  "all clean go";
			return false;
			
		} 

	} // end checkVoteStatus()

	/**
	 * this is a function to be called via ajax
	 * it returns an array with the new vote counts for a given entity
	 * (e.g. comment, question_concept, example_concept)
	 */
	private function reloadVotesCount($run_id, $obj_id, $obj_type, $prefix)
	{
    	
    	if($run_id!="" && $obj_id!="" && $obj_type!="" )
    	{
    	
			// get all votes for this post: note that we can use SUM in SQL instead 
		    $q = Doctrine_Query::create()
			->select ("v.id, v.vote_value, u.id, u.username")
			->from("Vote v")
			->innerJoin("v.User u")
			->where('v.run_id = ? AND obj_id = ? AND obj_type = ?' , 
			array($run_id,$obj_id, $obj_type))					
			->orderBy('v.id DESC');
			$votes = $q->fetchArray();
			
			$this->view->votesData=$votes;
			
			//echo "<hr>obj_id: ".$obj_id;
			//echo "<br>obj_type: ".$obj_type;;
			//echo "<br>votes: <br/>";
			// print_r($votes);
		
			// get the total
			$votesSumm = 0;
			$votesMinus = 0;
			$votesPlus = 0;
			foreach ($votes as $vote)
			{
				$votesSumm += $vote['vote_value'];
				if($vote['vote_value']==-1)
				{
					$votesMinus -= $vote['vote_value'];
				} else {
					$votesPlus += $vote['vote_value'];
				}
				
			}

			$contName = $prefix; 

			$votesArray = array(
			"voteOnId" 	=> $obj_id,
			"voteOnName"=> $contName,
			"votesSumm"	=>$votesSumm,
			"votesMinus"=>$votesMinus,
			"votesPlus"=>$votesPlus,
			);
			
			$this->view->votesVals = $votesArray;
			// end get votes
			
			$votesJson = json_encode($votesArray); 

			return $votesJson;
			;
    	} else {
    		return 2; // invalid parameters
    	}
		
	} // reloadVotesCount()
	
} // end class

