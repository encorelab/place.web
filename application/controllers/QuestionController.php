<?php
class QuestionController extends Zend_Controller_Action
{

    public function init()
    {
		Placeweb_Authorizer::authorize();
	}

    public function indexAction()
    {
    }
    
    public function updatestatusAction()
    {
	Placeweb_Authorizer::authorize("TEACHER");
		
    	$params = $this->getRequest()->getParams();
    	//print_r($params);
    	
    	//update('User u')
    	
    	// set('u.username', '?', 'jwage')
    	
			// Set user id = 1 to active
		Doctrine_Query::create()
		  ->update('Question e')
		  ->set('e.is_published', '?', $params['is_published'])
		  ->set('e.content', '?', $params['content'])
		  ->set('e.name', '?', $params['name'])
		  ->set('e.allow_multipe_answer', '?', $params['allow_multipe_answer'])
		  ->where('e.run_id = ? AND e.author_id = ? AND e.id = ?' , array($_SESSION['run_id'], $_SESSION['author_id'], $params['question_id']))
		  ->execute();

		  if($params['is_published']==1)
		  {
			// insert activity log
			$activity = new Activity();
			$activity->run_id = $_SESSION['run_id'];
			$activity->author_id = $_SESSION['author_id'];
			//$question_comment->date_modified = date( 'Y-m-d H:i:s');
			$activity->date_created = date( 'Y-m-d H:i:s');
			$activity->activity_type_id = 12;

			$activity->i1 = $params['question_id'];
			$activity->i2 = "";
			$activity->i3 = "";
			$activity->i4 = "";
			$activity->i5 = "";
			
			$activity->s1 = "Questions";
			$activity->s2 = "";
			$activity->s3 = "";
			
			$activity->t1 = "Questions";
			$activity->t2 = "";
			
			$activity->save();
		  }
			
		  //header('Location: /question/show?id='.$params['question_id']);
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
					
				} else if($_SESSION["profile"]=="STUDENT"){
					
					$q = Doctrine_Query::create()
					->select ("a.*, u.*")
					->from("Answer a")
					->innerJoin("a.User u")
					->where('a.run_id = ? AND a.question_id = ? AND a.author_id = ?' , 
					array($_SESSION['run_id'], $question[0]['id'], $_SESSION['author_id']))
					->orderBy('a.id DESC');
					$answer = $q->fetchArray();
				}

				//print_r($answer);
				// check student has answered the question
				$this->view->answer = $answer;
				if (count($answer)==0)
				{
					$this->view->answerFirst = false;
				} else {
					$this->view->answerFirst = true;
				}
			}
    	} else {
    		// select all questions [list-view]
			$k = Doctrine_Query::create()
			->select('e.id, e.name, e.is_published')
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
		Placeweb_Authorizer::authorize("TEACHER");
		
    	// get concepts data from db
    	
    	// using fixed concepts array in config.php
    	global $PLACEWEB_CONFIG;
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
		//$activity->activity_on_user //need question author_id here
		
		$activity->i1 = $params['question_id'];
		$activity->i2 = $answer->id;
		//$activity->i3 = "";
		//$activity->i4 = "";
		//$activity->i5 = "";
		$activity->s1 = "Question";
		$activity->s2 = "Answer";
		//$activity->s3 = "";
		$activity->t1 = "Answered a Question";
		//$activity->t2 = "";

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
	    $question->is_published = $params['is_published'];
		$question->allow_multipe_answer = $params['allow_multipe_answer'];

        $question->save();
        
        //echo "<hr>Question Id: ".$question->id;
        
        if($params['is_published']==1)
        {
			// insert activity log
			$activity = new Activity();
			$activity->run_id = $_SESSION['run_id'];
			$activity->author_id = $_SESSION['author_id'];
			//$question_comment->date_modified = date( 'Y-m-d H:i:s');
			$activity->date_created = date( 'Y-m-d H:i:s');
			$activity->activity_type_id = 12;
			
			$activity->i1 = $question->id;
			$activity->s1 = "Question"; // fixed!
			$activity->t1 = "Question Added"; // fixed!
	
			$activity->save();
        }
		
        $this->addTagsToQuestion($question->id);
        
		//echo "<br>activity Id: ".$activity->id;
		// redirect to home
		header('Location: /question/show/?id='.$question->id);
    }

    /**
     * 
     * Adds a relationship for each selected tag/concept  
     * @param int $questionId The id of the entity (e.g. example, question, etc...)
     */
    private function addTagsToQuestion($questionId)
    {
    	$params = $this->getRequest()->getParams();
    	
	    //get all Concepts/tags for this run_id
		$q = Doctrine_Query::create()
			->select('e.id,  e.name')
			->from('Concept e')
			->where('e.run_id = ?', $_SESSION['run_id']);
		
		$theConcepts = $q->fetchArray();
		
		// loop the tags and add a relationship if the tag was selected   
		foreach($theConcepts as $concept)
		{
			if(isset($params['concept_id__'.$concept['id']]))
			{
				//echo "<hr/>".$questionId."::".$params['concept_id__'.$concept['id']]." ::".$concept['id'];
				$question_concept = new QuestionConcept();
		        
				$question_concept->run_id = $_SESSION['run_id'];
				$question_concept->author_id = $_SESSION['author_id'];
				//$question_concept->date_modified = date( 'Y-m-d H:i:s');
				$question_concept->date_created = date( 'Y-m-d H:i:s');
				//$question_concept->example_id= $example->id;
				$question_concept->question_id= $questionId;
				$question_concept->concept_id= $concept['id'];
				$question_concept->save();
				//echo "<br>Example_concept Id: ".$questionId;

				// add activity log for each example_concept 
				if(isset($questionId) && isset($question_concept->id))
				{
					// add activity log for each concept
					//$this->addActivity(16, $questionId, $concept['id'], $question_concept->id, "Question", "Concept", "QuestionConcept", "Tagged Question with a Concept", null);
				} 
			} // end add example_concept activity log
		} // end for
    }
    
    /**
     * 
     * Add an activity log
     * @param int $activity_type_id
     * @param int $i1 
     * @param int $i2 
     * @param int $i3 
     * @param string $s1 
     * @param string $s2  
     * @param string $s3
     * @param text $t1
     * @param text $t2
     */
    private function addActivity($activity_type_id, $i1, $i2, $i3, $s1, $s2, $s3, $t1, $t2)
	{
		// insert activity log
		$activity = new Activity();
		$activity->run_id = $_SESSION['run_id'];
		$activity->author_id = $_SESSION['author_id'];
		$activity->date_created = date( 'Y-m-d H:i:s');
		
		$activity->activity_type_id = $activity_type_id; 

		$activity->i1 = $i1;
		$activity->i2 = $i2;
		$activity->i3 = $i3;
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

}

