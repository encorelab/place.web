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
    
    public function updatestatusAction()
    {
    	$params = $this->getRequest()->getParams();
    	print_r($params);
    	
    	//update('User u')
    	
    	// set('u.username', '?', 'jwage')
    	
		// Set user id = 1 to active
		Doctrine_Query::create()
		  ->update('Question e')
		  ->set('e.status', '?', $params['status'])
		  ->where('e.run_id = ? AND e.author_id = ? AND e.id = ?' , array($_SESSION['run_id'], $_SESSION['author_id'], $params['question_id']))
		  ->execute();
		  
		  header('Location: /question/show?id='.$params['question_id']);
		        
    }
    public function myjointestAction()
    {
    	
    			$q = Doctrine_Query::create()
					->select ("a.*, u.username")
					->from("Answer a")
					->innerJoin("a.User u")
					->where('a.run_id = ? AND a.question_id = ?' , 
					array(1, 1))					
					->orderBy('a.id DESC');
					$answer = $q->fetchArray();
					
					print_r($answer);
					
    }
    
    public function showAction()
    {
    	
    	global $PLACEWEB_CONFIG;
    	// pass the config as a view.
    	$this->view->PLACEWEB_CONFIG=$PLACEWEB_CONFIG;
    	
    	//print_r($_SESSION);
    	
    	$params = $this->getRequest()->getParams();
    	
    	//print_r($params);
    	
    	// select one question to display
    	if(isset($params['id']) && $params['id']!="")
    	{
			$q = Doctrine_Query::create()
			->select('e.*')
			->from('Question e')
			->where('e.run_id = ? AND e.id = ?' , array($_SESSION['run_id'], $params['id']))
			->orderBy('e.id DESC');
			$question = $q->fetchArray();
			//print_r($question);
			
			if(!isset($question[0]['id']))
			{
				$type=-1; // the question does not exist
			} else {
				
				$type=1; // single view

				// get answers data 
				
				//if(isset($params['all']) && $params['all']==1 && $_SESSION["profile"]=="TEACHER")
				if($_SESSION["profile"]=="TEACHER")
				{
					$q = Doctrine_Query::create()
					->select ("a.*, u.*")
					->from("Answer a")
					->innerJoin("a.User u")
					->where('a.run_id = ? AND a.question_id = ?' , 
					array($_SESSION['run_id'], $question[0]['id']))					
					->orderBy('a.id DESC');
					$answer = $q->fetchArray();
					
					print_r($answer);
					
					/*
					$q = Doctrine_Query::create()
					->select('e.*')
					->from('Answer e')
					->where('e.run_id = ? AND e.question_id = ?' , array($_SESSION['run_id'], $question[0]['id']))
					->orderBy('e.id DESC');   
					$answer = $q->fetchArray();
					*/ 	
					
				} else if($_SESSION["profile"]=="STUDENT"){
					
					$q = Doctrine_Query::create()
					->select ("a.*, u.*")
					->from("Answer a")
					->innerJoin("a.User u")
					->where('a.run_id = ? AND a.question_id = ? AND a.author_id = ?' , 
					array($_SESSION['run_id'], $question[0]['id'], $_SESSION['author_id']))
					->orderBy('a.id DESC');
					$answer = $q->fetchArray();
					
					print_r($answer);
					

					/*
					$q = Doctrine_Query::create()
					->select('e.*')
					->from('Answer e')

					->where('e.run_id = ? AND e.question_id = ? AND e.author_id = ?' , array($_SESSION['run_id'], $question[0]['id'], $_SESSION['author_id']))
					->orderBy('e.id DESC');   
					$answer = $q->fetchArray();
					*/ 	
				}

				/*
$q = Doctrine_Query::create()
  ->from('User u')
  ->innerJoin('u.Groups g WITH g.name != ?', 'Group 2')
				 */
				$this->view->answer = $answer;
				
				print_r($answer);
			}
			
			
    	} else {
    		// select all questions [list]
			$k = Doctrine_Query::create()
			->select('e.id, e.name')
			->from('Question e')
			->where('e.run_id = ?' , $_SESSION['run_id'])
			->orderBy('e.id DESC');
			
			$question = $k->fetchArray();
			//print_r($question);
			
			if(!isset($question[0]['id']))
			{
				$type=-2; // there are no questions
			} else {
				$type=0; // multiple view
			}
			
			// return an emtpy array
			$this->view->answer = array();
    	}

    	$this->view->question = $question;
		$this->view->type = $type;

		
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
    
public function addanswerAction(){

    	global $PLACEWEB_CONFIG, $_SESSION;
    	
        $params = $this->getRequest()->getParams();
        
        //if($params['saved'])
        
        //print_r($params);

        // set a defaut name
        if(isset($params['content']) && $params['content']!="")
        {
        	$content = $params['content'];
        } else {
        	$content = "[ ... ]";
        }
        
        // set a defaut content
        if(isset($params['name']) && $params['name']!="")
        {
        	$name = $params['name'];
        } else {
        	$name = "[ ... ]";
        }
              
        // set a defaut content
        if(isset($params['mc_chocie']) && $params['mc_chocie']!="")
        {
        	$mc_chocie = $params['mc_chocie'];
        } else {
        	$mc_chocie = "";
        }
                
        
        $answer = new Answer(); 
               
		$answer->run_id = $_SESSION['run_id'];
		$answer->author_id = $_SESSION['author_id'];
		$answer->date_created = date( 'Y-m-d H:i:s');
		$answer->name = $name;
		$answer->question_id = $params['question_id'];
		$answer->content = $content;
		$answer->mc_chocie = $mc_chocie;

        $answer->save();
        
        //echo "<hr>Answer Id: ".$answer->id;
        
		// insert activity log
		$activity = new Activity();
		$activity->run_id = $_SESSION['run_id'];
		$activity->author_id = $_SESSION['author_id'];
		//$question_comment->date_modified = date( 'Y-m-d H:i:s');
		$activity->date_created = date( 'Y-m-d H:i:s');
		$activity->activity_type_id = 13;
		//$activity->activity_on_user
		
		$activity->i1 = $answer->id;
		$activity->i2 = $params['question_id'];
		$activity->i3 = "";
		$activity->i4 = "";
		$activity->i5 = "";
		$activity->s1 = "";
		$activity->s2 = "";
		$activity->s3 = "";
		$activity->t1 = "Answer";
		$activity->t2 = "Question";

		$activity->save();
		
		//echo "<br>activity Id: ".$activity->id;
		// redirect to home
		header('Location: /question/show?id='.$params['question_id']);
		 
	
	
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
              
        $question = new Question();
               
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
		$question->status = $params['status'];

        $question->save();
        
        //echo "<hr>Question Id: ".$question->id;
        
		// insert activity log
		$activity = new Activity();
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
		
		//echo "<br>activity Id: ".$activity->id;
		// redirect to home
		header('Location: /myhome');
    }

}

