<?php

if(isset($_REQUEST['tagVoted']))
{
	$tagVoted = $_REQUEST['tagVoted'];
} else {
	$tagVoted = "";
}

echo "".$tagVoted;

if(isset($_REQUEST['replyPosted']))
{
	$replyPosted = $_REQUEST['replyPosted'];
} else {
	$replyPosted = "";
}

if(isset($_REQUEST['eloId']))
{
	$eloIdActive = $_REQUEST['eloId'];
} else {
	$eloIdActive = "";
}

// get and save data from tag votes 
if($tagVoted==1)
{
	
} // end get and save data from tag votes



// get and save data from post reply or new thread 
if($replyPosted==1)
{
	if(isset($_REQUEST['postId']))
	{
		$postId = $_REQUEST['postId'];
	} else {
		$postId = "";
	}
	
	if(isset($_REQUEST['replyText']))
	{
		$replyText = $_REQUEST['replyText'];
	} else {
		$replyText = "";
	}

	if(isset($_REQUEST['parentType']))
	{
		$parentType = $_REQUEST['parentType'];
	} else {
		$parentType = "";
	}
	
	// create comment
	
	/*
	obj_type (s)
	1 comments
	2 answers
	3 examples
	*/
		
	$myComment = new Comment();
	
	
	if($parentType=="post") // comment
	{
		//$myMongoObj->__pushValueIntoArray('posts', $postId, 'replies', $NewPostRef);
		
		$myComment->obj_id = 1;
		$myComment->obj_type = 1;
		$myComment->content = $replyText;
		$myComment->parent_id = $postId ;
	
	} else if($parentType=="elo") { // example
		// 
		//$myMongoObj->__pushValueIntoArray('elos', $eloIdActive, 'discussion', $NewPostRef);
		
		$myComment->obj_id = 3; 
		$myComment->obj_type = 3;
		$myComment->content = $replyText;
		$myComment->parent_id = $eloIdActive ;
	}
	
	$lastId = $myComment->save();
	
	echo "<hr/>Id:".$lastId;
	
} // end get and save data from post reply or new thread 


//$examples = new Examples();
