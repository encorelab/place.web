<?php

class QuestionController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
    }
    
    public function showAction(){
        $examples = Doctrine::getTable("Examples")->findAll(Doctrine::HYDRATE_ARRAY);
        
        $this->view->myExamples = $examples;
    }
    
    public function addformAction(){
    	// get concepts data from db
    	
    	// using fixed concepts array in config.php
    	global $PLACEWEB_CONFIG, $_SESSION;
    	//require(APPLICATION_PATH.'/configs/config.php');
    	
//    	print_r($PLACEWEB_CONFIG['fConcepts']);
    	
    	$this->view->fConcepts = $PLACEWEB_CONFIG['fConcepts'];
    	$this->view->questionTypes = $PLACEWEB_CONFIG['questionTypes'];
    	$this->view->questionTypes = $PLACEWEB_CONFIG['questionTypes'];
    	$this->view->uploadDir = $PLACEWEB_CONFIG['uploadDir'];
    }
    
    public function addAction(){

    	global $PLACEWEB_CONFIG, $_SESSION;
    	
        $params = $this->getRequest()->getParams();
        
        //if($params['saved'])
        
        //print_r($params);
        
        // set a defaut name
        if(isset($params['name']) && $params['name']!="")
        {
        	$name = $params['name'];
        } else {
        	$name = "[ ... ]";
        }
              
        $question = new Questions();
               
		$question->run_id = $_SESSION['run_id'];
		$question->author_id = $_SESSION['author_id'];
		//$question->date_modified = date( 'Y-m-d H:i:s');
		$question->date_created = date( 'Y-m-d H:i:s');
		$question->name = $name;
		$question->content = $params['content'];
		$question->media_content = $params['media_content'];
		$question->media_path = $params['media_path'];
		$question->media_type = $params['media_type'];
		$question->type = $params['question_type'];
		$question->choices = $params['mc-list'];

        $question->save();
        
        echo "<hr>Question Id: ".$question->id;
        
		// insert activity log
		$activity = new Activities();
		$activity->run_id = $_SESSION['run_id'];
		$activity->author_id = $_SESSION['author_id'];
		//$question_comment->date_modified = date( 'Y-m-d H:i:s');
		$activity->date_created = date( 'Y-m-d H:i:s');
		$activity->activity_type_id = 12;
		//$activity->activity_on_user
		
		$activity->i1 = $question->id;
		$activity->i2 = "";
		$activity->i3 = "";
		$activity->i4 = "";
		$activity->i5 = "";
		$activity->s1 = "";
		$activity->s2 = "";
		$activity->s3 = "";
		$activity->t1 = "Questions";
		$activity->t2 = "";

		$activity->save();
		
		echo "<br>activity Id: ".$activity->id;
		// redirect to home
		header('Location: /myhome');
    }


}

