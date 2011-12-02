<?php
class ExampleController extends Zend_Controller_Action
{

    public function init()
    {
            /* check session var */
    	if(!isset($_SESSION['access']))
    	{
    		header('Location: /');
    		exit;
    	}
	}

    public function indexAction()
    {
        // action body
    }
    
    public function showAction()
    {
         global $PLACEWEB_CONFIG;
    	// pass the config as a view.
    	$this->view->PLACEWEB_CONFIG=$PLACEWEB_CONFIG;
    	$params = $this->getRequest()->getParams();

    	// select one example to display
    	if(isset($params['id']) && $params['id']!="")
    	{
			$q = Doctrine_Query::create()
			->select('e.*')
			->from('Example e')
			->where('e.run_id = ? AND e.id = ?' , array($_SESSION['run_id'], $params['id']))
			->orderBy('e.id DESC');
			$example = $q->fetchArray();
			
			//print_r($example);
			
			if(!isset($example[0]['id']))
			{
				$type=-1; // the example does not exist
			} else {
				
				$type=1; // single view
			}
    	
    	} else {
    		// select all examples [list]
			$k = Doctrine_Query::create()
			->select('e.id, e.name, e.is_published')
			->from('Example e')
			->where('e.run_id = ?' , $_SESSION['run_id'])
			->orderBy('e.id DESC');
			
			$example = $k->fetchArray();
			//print_r($example);
			
			if(!isset($example[0]['id']))
			{
				$type=-2; // there are no examples
			} else {
				$type=0; // multiple view
			}
			
			// return an emtpy array
			$this->view->answer = array();
    	}

    	$this->view->example = $example;
		$this->view->type = $type;
		
		$this->view->notAssessedItems=0;
			
		
    	//print_r($_SESSION);
    	

    } // end showAction()
    
    public function addformAction(){
    	// get concepts data from db
    	
    	// using fixed concepts array in config.php
    	global $PLACEWEB_CONFIG;
    	
    	
    	//print_r($PLACEWEB_CONFIG['fConcepts']);
    	
    	// ??? check this
    	$this->view->fConcepts = $PLACEWEB_CONFIG['fConcepts'];
		$this->view->uploader = $PLACEWEB_CONFIG['fileuploader'];
    }
    
    public function addAction(){
    	global $PLACEWEB_CONFIG;
    	
        $params = $this->getRequest()->getParams();

        // set a defaut name if not set
        if(isset($params['example-name']) && $params['example-name']!="")
        {
        	$name = $params['example-name'];
        } else {
        	$name = "[ ... ]";
        }
              
        $example = new Example();
		$example->run_id = $_SESSION['run_id'];
		$example->author_id = $_SESSION['author_id'];
		//$example->date_modified = date( 'Y-m-d H:i:s');
		$example->date_created = date( 'Y-m-d H:i:s');
		$example->name = $name;
		$example->content = $params['content'];
		$example->media_content = $params['media_content'];
		$example->media_path = $params['media_path'];
		$example->media_type = $params['media_type'];
		$example->type = $params['type'];
		$example->is_published = $params['is_published'];
//		$example->is_public = $params['is_public'];
	    $example->save();
        
        $this->view->newExample = $example;

        // insert activity log for example
		$this->addActivity(11, $example->id, null, null, "Example", null, null, "Example Added", null);
        
		//echo "<hr>Example Id: ".$example->id;

        // insert rational as a first comment
        $comment = new Comment();
        $comment->run_id = $_SESSION['run_id'];
        $comment->author_id = $_SESSION['author_id'];
        //$comment->date_modified
        $comment->date_created = date( 'Y-m-d H:i:s');
        $comment->obj_id = $example->id;
        $comment->obj_type = 3; // commentable id = example
        $comment->content = $params['content'];
        $comment->parent_id = null;
        $comment->save();

        // associate example with concepts/tags
    	 $this->addTagsToExample($example->id);

		// redirect to home
		header('Location: /example/show?id='.$example->id);

    } // end fnc
    
    
    /**
     * 
     * Adds a relationship for each selected tag/concept  
     * @param int $exampleId The id of the entity (e.g. example, question, etc...)
     */
    private function addTagsToExample($exampleId)
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
				//echo "<hr/>".$exampleId."::".$params['concept_id__'.$concept['id']]." ::".$concept['id'];
				$example_concept = new ExampleConcept();
		        
				$example_concept->run_id = $_SESSION['run_id'];
				$example_concept->author_id = $_SESSION['author_id'];
				//$example_concept->date_modified = date( 'Y-m-d H:i:s');
				$example_concept->date_created = date( 'Y-m-d H:i:s');
				//$example_concept->example_id= $example->id;
				$example_concept->example_id= $exampleId;
				$example_concept->concept_id= $concept['id'];
				$example_concept->save();
				//echo "<br>Example_concept Id: ".$exampleId;

				// add activity log for each example_concept 
				if(isset($exampleId) && isset($example_concept->id))
				{
					// add activity log for each concept
					$this->addActivity(17, $exampleId, $concept['id'], $example_concept->id, "Example", "Concept", "ExampleConcept", "Tagged Example with a Concept", null);
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
	
    public function updateAction()
    {
		//Placeweb_Authorizer::authorize("TEACHER");
		
    	$params = $this->getRequest()->getParams();
    	//print_r($params);
    	
		// Update example 
		Doctrine_Query::create()
		  ->update('Example e')
		  ->set('e.name', '?', $params['example-name'])
		  ->set('e.type', '?', $params['type'])
		  ->set('e.is_published', '?', $params['is_published'])
		  ->set('e.content', '?', $params['content'])
		  ->set('e.media_path', '?', $params['media_path'])
		  ->set('e.media_content', '?', $params['media_content'])
		  ->set('e.media_type', '?', $params['media_type'])
		  ->where('e.run_id = ? AND e.author_id = ? AND e.id = ?' , array($_SESSION['run_id'], $_SESSION['author_id'], $params['example_id']))
		  ->execute();

		  // get first comment id for this example: !
			$qLastComment = Doctrine_Query::create()
			->select('c.*')
			->from('Comment c')
			->where('c.run_id = ? AND c.obj_id = ? AND c.obj_type = ?',
				array($_SESSION['run_id'], $params['example_id'], 3)) 
				// Find comment on an example; obj_type = 3
			->orderBy('c.id DESC');
			$lastComment = $qLastComment->fetchArray();
			print_r($lastComment);
		  
		   // get id from last id
		  $comment_id = 0;
		  if(isset($lastComment[0]))
		  {
		  	$comment_id = $lastComment[0]['id'];
		  }
		
		// Update first comment 
		Doctrine_Query::create()
		  ->update('Comment c')
		  ->set('c.content', '?', $params['content'])
		  ->where('c.run_id = ? AND c.author_id = ? AND c.id = ?' ,
		  		array($_SESSION['run_id'], $_SESSION['author_id'], $comment_id))
		  ->execute();
		  
		  /*
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
		  */
			
		  //header('Location: /question/show?id='.$params['question_id']);
		  header('Location: /example/show?id='.$params['example_id']);
		        
    }

} // end class

