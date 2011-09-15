<?php

class CommentController extends Zend_Controller_Action
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
		
    	if($params['parentType']==3){
			$activity->activity_type_id = 7;
			$activity->t2 = "Example";
		}
		
		if($params['parentType']==1){
			$activity->activity_type_id = 5;
			$activity->t2 = "Comment";
		}
		
		//$activity->activity_on_user
		
		$activity->i1 = $comment->id;
		$activity->i2 = $params['obj_id'];
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
		header('Location: /example/show?id='.$params['example_id']);
		
    } // end addcommentAction()

	
} // end class

