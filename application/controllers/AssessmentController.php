<?php

class AssessmentController extends Zend_Controller_Action
{

    public function init()
    {
        /* check session var */
    	if(!$_SESSION['access'])
    	{
    		header('Location: /');
    	}
    }

    public function indexAction()
    {
    	// action body
    	global $PLACEWEB_CONFIG;
    	
 		
		//print_r($data);
        
    }
    
    public function addAction(){
    	// get concepts data from db

    	global $PLACEWEB_CONFIG, $_SESSION;
    	
        $params = $this->getRequest()->getParams();
        
        // insert assessment review
        
        if (isset($params['parent_id']) && $params['parent_id']!="")
        {
        	$prefix=$params['prefix'];
        	
        	$activity_type_id = $params[$prefix.'activity_type_id'];
        	
        	$i1=$params['parent_id'];
        	
        	$s1=$params[$prefix.'s1'];
        	$s2=$params[$prefix.'s2'];
        	$s3=$params[$prefix.'s3'];
        	$t1=$params[$prefix.'t1'];
        	
        	// create a new Assessment Review
	        $aReview = new AssessmentReviews();
			$aReview->run_id = $_SESSION['run_id'];
			$aReview->author_id = $_SESSION['author_id'];
			$aReview->date_created = date( 'Y-m-d H:i:s');
		
			$aReview->log = $params['review-log'];
			$aReview->i1= $params['parent_id'];
			$aReview->t1= $params['parent_type'];
			
			$aReview->save();
		
		//echo "<hr>Assessment Review Id: ".$aReview->id;
		
			// insert marck for each element
			$assessList=explode(',', $params['assesment_list']);
			//print_r($assessList);
			
		foreach ($assessList as $elementId)
		{
			// check if a mark was send for this element (e.g. comment, answer id) 
			// if not, the element will remain without assessment: save practice ;)
			if(isset($params['mark_'.$elementId]) && $elementId!="")
			{
				$obj_id =  $params['obj_id_'.$elementId];
				$i2=$obj_id;
				
				$mark = $params['mark_'.$elementId];
				$activity_on_user=$params['author_id_'.$elementId];
				
				$assessment_id=$this->addAssessment($obj_id, $params['obj_type'], $mark, $aReview->id);
				$i3=$assessment_id;
				
				//echo "<hr>assessment_id:".$assessment_id;

				// need to fix: insert an activity log for each assessment
				$this->addActivity($activity_type_id, $activity_on_user, $i1, $i2, $i3, $s1, $s2, $s3, $t1);
				
			} // end if
		} // end for
        } // end if
        
        header('Location: '.$_SERVER['HTTP_REFERER']);
    } // end addcommentAction()
    
    private function addAssessment($obj_id, $obj_type, $mark, $assessment_review_id)
    {
        // create a new Assessment
        $assessment = new Assessment();
		$assessment->run_id = $_SESSION['run_id'];
		$assessment->author_id = $_SESSION['author_id'];
		//$assessment->date_modified = date( 'Y-m-d H:i:s');
		$assessment->date_created = date( 'Y-m-d H:i:s');
		
		$assessment->obj_id = $obj_id;
		$assessment->obj_type = $obj_type;
		$assessment->mark= $mark;
		$assessment->assessment_review_id= $assessment_review_id;
		$assessment->save();
		
		return $assessment->id;
		
		//echo "<hr>Assessment Id: ".$assessment->id;
		
		//header('Location: '.$_SERVER['HTTP_REFERER']);
		  //*/
    	
    } 
    
    private function addActivity($activity_type_id,$activity_on_user,$i1,$i2,$i3,$s1,$s2,$s3,$t1)
    {
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
		$activity->i3 = $i3; // the assessment inserted
		$activity->i4 = "";
		$activity->i5 = "";
		
		$activity->s1 = $s1;
		$activity->s2 = $s2;
		$activity->s3 = $s3;
		
		$activity->t1 = $t1;
		//$activity->t2 = $t2;
		$activity->save();
			//echo "<br>activity Id: ".$activity->id;

    } 
	
} // end class

