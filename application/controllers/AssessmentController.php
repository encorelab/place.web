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
        
        print_r($params);
        /*
        // create a new comment object
        $assessment = new Assessment();
		$assessment->run_id = $_SESSION['run_id'];
		$assessment->author_id = $_SESSION['author_id'];
		//$assessment->date_modified = date( 'Y-m-d H:i:s');
		$assessment->date_created = date( 'Y-m-d H:i:s');
		$assessment->obj_id = $params['answer_id'];
		$assessment->obj_type = $params['obj_type'];
		
		$assessment->mark= $params['mark_'.$params['answer_id']]; // note the marks have the form "mark_[object_id]"

		$assessment->save();
        
        echo "<hr>Assessment Id: ".$assessment->id;
        
		// insert activity log
		$activity = new Activities();
		$activity->run_id = $_SESSION['run_id'];
		$activity->author_id = $_SESSION['author_id'];
		$activity->date_created = date( 'Y-m-d H:i:s');
		$activity->activity_type_id = 10; //assessed answer
		$activity->i1 = $assessment->id;
		$activity->i2 = $params['answer_id'];
		$activity->i3 = $params['question_id'];
		$activity->i4 = "";
		$activity->i5 = "";
		$activity->s1 = "";
		$activity->s2 = "";
		$activity->s3 = "";
		$activity->t1 = "Answer";
		$activity->t2 = "Question";
		
		$activity->save();
		
			echo "<br>activity Id: ".$activity->id;
			
		// redirect to home
		//header('Location: /question/show?id='.$params['question_id']);
		 
		 */
        
    } // end addcommentAction()
	
} // end class

