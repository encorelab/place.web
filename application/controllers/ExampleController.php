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
    
    public function showAction(){
        $examples = Doctrine::getTable("Examples")->findAll(Doctrine::HYDRATE_ARRAY);
        
        $this->view->myExamples = $examples;
    }
    
    public function addformAction(){
    	// get concepts data from db
    	
    	// using fixed concepts array in config.php
    	global $PLACEWEB_CONFIG, $_SESSION;
    	//require(APPLICATION_PATH.'/configs/config.php');
    	
    	//print_r($PLACEWEB_CONFIG['fConcepts']);
    	
    	$this->view->fConcepts = $PLACEWEB_CONFIG['fConcepts'];
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
    	foreach ($PLACEWEB_CONFIG['fConcepts'] as $cId => $cName)
		{
			//$mysql.="INSERT INTO concepts (run_id, author_id, date_modified, date_created, name) VALUES (1, 1, '2011-09-08 14:25:59', '2011-09-08 14:25:59', '".$cName."');<br>";
			//echo "<br/>".$cId;
			if(isset($params['concept_id__'.$cId]))
			{
				echo "<hr/>".$cName;
				$example_comment = new ExampleConcept();
		        
				$example_comment->run_id = $_SESSION['run_id'];
				$example_comment->author_id = $_SESSION['author_id'];
				//$example_comment->date_modified = date( 'Y-m-d H:i:s');
				$example_comment->date_created = date( 'Y-m-d H:i:s');
				$example_comment->example_id= $example->id;
				$example_comment->concept_id= $cId;
				$example_comment->save();
				echo "<br>Example_concept Id: ".$example_comment->id;
			}
		} // end for
		
		// insert activity log
		$activity = new Activity();
		$activity->run_id = $_SESSION['run_id'];
		$activity->author_id = $_SESSION['author_id'];
		//$example_comment->date_modified = date( 'Y-m-d H:i:s');
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

