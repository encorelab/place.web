<?php
class ExampleController extends Zend_Controller_Action
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
			->select('e.id, e.name')
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

        $example->save();
        
        $this->view->newExample = $example;
        
        echo "<hr>Example Id: ".$example->id;
        

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

        // associate example with concepts
        
        $mysql="";
        
        $mysql="";
        
	    	//get all Concepts in db for comparison: which ones are not added yet
		$q = Doctrine_Query::create()
			->select('e.id,  e.name')
			->from('Concept e')
			->where('e.run_id = ?', $_SESSION['run_id']);
		
		$theConcepts = $q->fetchArray();
		
		// adjust the concepts from db 
		foreach($theConcepts as $concept)
		{
			if(isset($params['concept_id__'.$concept['id']]))
			{
				//echo "<hr/>".$cName;
				$example_concept = new ExampleConcept();
		        
				$example_concept->run_id = $_SESSION['run_id'];
				$example_concept->author_id = $_SESSION['author_id'];
				//$example_concept->date_modified = date( 'Y-m-d H:i:s');
				$example_concept->date_created = date( 'Y-m-d H:i:s');
				$example_concept->example_id= $example->id;
				$example_concept->concept_id= $concept['id'];
				$example_concept->save();
				echo "<br>Example_concept Id: ".$example_concept->id;
			}
		} // end for
		
		// insert activity log
		$activity = new Activity();
		$activity->run_id = $_SESSION['run_id'];
		$activity->author_id = $_SESSION['author_id'];
		//$example_concept->date_modified = date( 'Y-m-d H:i:s');
		$activity->date_created = date( 'Y-m-d H:i:s');
		$activity->activity_type_id = 11;
		//$activity->activity_on_user
		
		$activity->i1 = $example->id;
		$activity->i2 = "";
		$activity->i3 = "";
		$activity->i4 = "";
		$activity->i5 = "";
		$activity->s1 = "";
		$activity->s2 = "";
		$activity->s3 = "";
		$activity->t1 = "Examples";
		$activity->t2 = "";
		
		
		$activity->save();
		echo "<br>activity Id: ".$activity->id;
		
		//echo '<textarea>'.$mysql.'</textarea>';
		//echo "<hr>".$mysql;
		
		
		    	// disableLayout
    	//$this->_helper->layout()->disableLayout();
		
		
		// redirect to home
		header('Location: /myhome');

    } // end fnc

} // end class

