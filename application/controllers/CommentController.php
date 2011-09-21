<?php

class CommentController extends Zend_Controller_Action
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
    	global $PLACEWEB_CONFIG;
    	
        $params = $this->getRequest()->getParams();
        
        //print_r($params);
        
        //if($params['saved'])
            
        $comment = new Comment();
               
		$comment->run_id = $_SESSION['run_id'];
		$comment->author_id = $_SESSION['author_id'];
		//$comment->date_modified = date( 'Y-m-d H:i:s');
		$comment->date_created = date( 'Y-m-d H:i:s');
		
		$comment->obj_id = $params['obj_id'];

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

// this are always used to store the entry point: example
		$activity->i1 = $params['obj_id'];
		$activity->s1 = "Example"; 

		// comment on example
	    	if($params['parentType']==3){
			$activity->activity_type_id = 7;
			$activity->t1 = "Comment on Example";
		}
		
		// comment on comment		
		if($params['parentType']==1){
			$activity->activity_type_id = 5;
			$activity->t1 = "Comment on Comment";

			$activity->i2 = $comment->id;
			$activity->s2 = "Comment";
		}
		
		$activity->activity_on_user=$params['activity_on_user'];
		
		$activity->save();
		
		//echo "<br>activity Id: ".$activity->id;
		// redirect to home
		header('Location: /example/show?id='.$params['example_id']);
	
        	
    } // end addcommentAction()

	
} // end class

