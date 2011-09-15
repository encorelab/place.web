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
        
        // create a new comment object
        $comment = new Comments();
		$comment->run_id = $_SESSION['run_id'];
		$comment->author_id = $_SESSION['author_id'];
		//$comment->date_modified = date( 'Y-m-d H:i:s');
		$comment->date_created = date( 'Y-m-d H:i:s');
		$comment->obj_id = $params['eloId'];
		$comment->obj_type = $params['parentType'];
		
        // set a defaut name if not set
        if(isset($params['replyText']) && $params['replyText']!="")
        {
        	$content = $params['replyText'];
        } else {
        	$content = "[ ... ]";
        }
		$comment->content = $content;
		
		// [depreciated]
		// set parent id only when the parent is a comment
		if($params['parentType']==1){
			$comment->parent_id = $params['postId'];
		}

        $comment->save();
        
        //echo "<hr>Comment Id: ".$comment->id;
        
		// insert activity log
		$activity = new Activities();
		$activity->run_id = $_SESSION['run_id'];
		$activity->author_id = $_SESSION['author_id'];
		//$comment_comment->date_modified = date( 'Y-m-d H:i:s');
		$activity->date_created = date( 'Y-m-d H:i:s');
		
		// mapping the parent type with an activity type
    	if($params['parentType']==3){
			$activity->activity_type_id = 7;
			$activity->t2 = "Examples";
		}
		
		// note that questions are NOT commentable for now, but in case the are, set here the type_id 
		if($params['parentType']==1){
			$activity->activity_type_id = 5;
			$activity->t2 = "Questions";
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
		$activity->t1 = "Comments";
		
		$activity->save();
		
			//echo "<br>activity Id: ".$activity->id;
			
		// redirect to home
		header('Location: /discussion?type='.$params['parentType'].'&id='.$params['eloId']);
		
    } // end addcommentAction()
    
    public function addAction(){
        $params = $this->getRequest()->getParams();
        
        //if($params['saved'])
        
        echo "Params: <hr/>";
        print_r($params);
        echo "<hr/>";
      
        $this->view->newExample = "";
    }

	
} // end class

