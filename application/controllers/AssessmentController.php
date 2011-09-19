<?php

class AssessmentController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
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
        
        //print_r($params);

        // insert assessment review
        
        if (isset($params['parent_id']) && $params['parent_id']!="")
        {
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
			print_r($assessList);
			
			foreach ($assessList as $elementId)
			{
				// check if a mark was send for this element (e.g. comment, answer id) 
				// if not, the element will remain without assessment: save practice ;)
				if(isset($params['mark_'.$elementId]) && $elementId!="")
				{
					$obj_id =  $params['obj_id_'.$elementId];
					$mark = $params['mark_'.$elementId];
					
					
					$this->addAssessment($obj_id, $params['obj_type'], $mark, $aReview->id);
					
					// need to fix: insert an activity log for each assessment
					//$this->addActivity();
					
				} // end if
			} // end for
        } // end if
        
        
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
		
		//echo "<hr>Assessment Id: ".$assessment->id;
		
		header('Location: '.$_SERVER['HTTP_REFERER']);
    	
    } 
    
    private function addActivity($assessment_id,$activity_type_id,$i1,$i2,$t1,$t2)
    {
/*
		// insert activity log
		$activity = new Activities();
		$activity->run_id = $_SESSION['run_id'];
		$activity->author_id = $_SESSION['author_id'];
		$activity->date_created = date( 'Y-m-d H:i:s');
		
		$activity->activity_type_id = $activity_type_id; //assessed answer

		$activity->i1 = $i1;
		$activity->i2 = $i2;
		$activity->i3 = "";
		$activity->i4 = "";
		$activity->i5 = "";
		$activity->s1 = "";
		$activity->s2 = "";
		$activity->s3 = "";
		$activity->t1 = $t1;
		$activity->t2 = $t2;
		
		$activity->save();
		
			echo "<br>activity Id: ".$activity->id;
		
*/
		// redirect to home
		//header('Location: /question/show?id='.$params['question_id']);
    } 
	
} // end class

