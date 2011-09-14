<?php

class DiscussionController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
    	// action body
    	global $PLACEWEB_CONFIG;
    	
    	//print_r($_SESSION);

    	// pass the config as a view.
    	$this->view->PLACEWEB_CONFIG=$PLACEWEB_CONFIG;
    	
        $params = $this->getRequest()->getParams();
        
        if(isset($params['id']) && isset($params['type']))
        {
        	$this->view->activeId=$params['id'];
        	$this->view->type=$params['type'];
        	
        	//echo "<br/>activeId: ".$params['id'];
        	//echo "<br/>Type: ".$params['type'];
        	
        
        	
	        // select examples
	        if($params['type']=="3")
	        {
			    $q = Doctrine_Query::create()
				  ->from('Example e')
				  ->where('e.id = ?', $params['id']);
				 
				$data = $q->fetchArray();
				
				$this->view->type=3;
	        
	        // select questions
	        } else if($params['type']=="4") {
	        	
			    $q = Doctrine_Query::create()
				  ->from('Question e')
				  ->where('e.id = ?', $params['id']);
				 
				$data = $q->fetchArray();

				$this->view->type=4;
	        } // end if        	
        } else {
        	// select all examples by default: for testing
        	$data = Doctrine::getTable("Example")->findAll(Doctrine::HYDRATE_ARRAY);
        	$this->view->type=3;
        }// end if
        
		
		//print_r($data);
		
		$this->view->data = $data;
        
    }
    
    public function addcommentAction(){
    	// get concepts data from db
    	
/*
 * object_types
1	comments
2	answers
3	examples
4	questions

 */
    	global $PLACEWEB_CONFIG, $_SESSION;
    	
        $params = $this->getRequest()->getParams();
        
        //print_r($params);
        
        //if($params['saved'])
            
        $comment = new Comment();
               
		$comment->run_id = $_SESSION['run_id'];
		$comment->author_id = $_SESSION['author_id'];
		//$comment->date_modified = date( 'Y-m-d H:i:s');
		$comment->date_created = date( 'Y-m-d H:i:s');
		
		// obj_id 	obj_type 	content 	parent_id  
		
		$comment->obj_id = $params['eloId'];

		$comment->obj_type = $params['parentType'];
		$comment->content = $params['replyText'];
		
		if($params['parentType']==1){
			$comment->parent_id = $params['postId'];
		}

        $comment->save();
        
        //echo "<hr>Comment Id: ".$comment->id;
        
		// insert activity log
		$activity = new Activity();
		$activity->run_id = $_SESSION['run_id'];
		$activity->author_id = $_SESSION['author_id'];
		//$comment_comment->date_modified = date( 'Y-m-d H:i:s');
		$activity->date_created = date( 'Y-m-d H:i:s');
		
    	if($params['parentType']==3){
			$activity->activity_type_id = 7;
			$activity->t2 = "Example";
		}
		
		// note that there are no comments to questions
		if($params['parentType']==1){
			$activity->activity_type_id = 5;
			$activity->t2 = "Question";
		}
		
		//$activity->activity_on_user
		
		$activity->i1 = $comment->id;
		$activity->i2 = $params['eloId'];
		$activity->i3 = "";
		$activity->i4 = "";
		$activity->i5 = "";
		$activity->s1 = "";
		$activity->s2 = "";
		$activity->s3 = "";
		$activity->t1 = "Comment";
		
		$activity->save();
		
		//echo "<br>activity Id: ".$activity->id;
		// redirect to home
		header('Location: /discussion?type='.$params['parentType'].'&id='.$params['eloId']);
		
    } // end addcommentAction()
    
    public function showAction(){

    }
    
    public function addformAction(){
    	// get concepts data from db

    }
    
    public function addAction(){
        $params = $this->getRequest()->getParams();
        
        //if($params['saved'])
        
        echo "Params: <hr/>";
        print_r($params);
        echo "<hr/>";
      

        
        $this->view->newExample = "";
    }

	
} // end class

