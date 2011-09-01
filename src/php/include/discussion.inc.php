<?php

// using MongoDAO
$myMongoObj = new MongoDAO();

if(isset($_REQUEST['tagVoted']))
{
	$tagVoted = $_REQUEST['tagVoted'];
} else {
	$tagVoted = "";
}

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
	
	// create Post object
	$myPostObject = new Post($parentType, $_SESSION['username'], $replyText, new MongoTimestamp(), $_SESSION['runId'], '', array(), array());

	//Post($parentType, $author, $content, $timestamp, $runId, $grade, $votes, $replies)
	
	// using static
	//$newPostId = Manager::savePost($myPostObject);
	
	// using MongoDAO
	$newPostId = $myMongoObj->__saveCollection("posts", $myPostObject);
	
	// create a reference
	$NewPostRef = MongoDBRef::create($PLACEWEB_CONFIG['collections']["posts"], $newPostId);
	
	if($parentType=="post")
	{
		// push the ref object  into parent post's replies
		$myMongoObj->__pushValueIntoArray('posts', $postId, 'replies', $NewPostRef);
	} else if($parentType=="elo") {
		// push the ref object  into parent Elo's discussion
		$myMongoObj->__pushValueIntoArray('elos', $eloIdActive, 'discussion', $NewPostRef);
	}
} // end get and save data from post reply or new thread 


// 


	//$theQuery = array("_id" => new MongoId($eloIdActive));
$theQuery = array();
$theFields = array("_id", "name");
	//$theFields = array(); // if empty gets all fields

$myEloArray = $myMongoObj->__getByQuery("elos", $theQuery, $theFields); 
 
//Manager::getElo(''); // if no id gets all the collection.

//$myMapArray = Manager::getElo(''); // if no id gets all the collection.

//print_r($myMapArray);
$myEloListHtml="
<ul>";

foreach ($myEloArray as $elo)
{
	$myEloListHtml.= "
		<li><a href='?action=discussion&eloId=".$elo['_id']."'>".$elo['name']."</a></li>";
}
$myEloListHtml.="
</ul>";

?>
<div id="discussion-container">
	
	<!-- start elos-container -->
	<div id="elos-container">
	<h1>Elos</h1>
	<?php 
	echo $myEloListHtml;
	?>
	</div><!-- /elos-container -->
	
	<!-- start elo-discussion -->
	<div id="elo-discussion">
	<?php 
		
		if($eloIdActive!="")
		{
		
			$theQuery = array("_id" => new MongoId($eloIdActive));
			//$theFields = array("name", "content","discussion");
			$theFields = array(); // and empty array triggers a selection of all fields

			$theQuery = array("_id" => new MongoId($eloIdActive));
			//$theFields = array("name", "content","discussion");
			$theFields = array(); // and empty array triggers a selection of all fields
			
			$myContentArray = $myMongoObj->__getByQuery("elos", $theQuery, $theFields);

			// need some validation here for elo's data
			
		?>
	<h3><?php echo $myContentArray[0]['name']?></h3>
	<div id="elo-tags" class="dashlet-box" style="width:30%; float:right;">
		<div class="dashlet-title">Tags</div>
		<div id="tags-container">
		<?php //print_r($myContentArray[0]['tags']);?>
			<ul class="ul-for-data">
			<?php
			echo Manager::__analyzeTags($myContentArray[0]['tags']);

			?>
			</ul>
		</div>
	</div>			
		
	<div class="dashlet-box-image">
		<div><img width="320px" title="<?php echo $myContentArray[0]['name']?>" alt="<?php echo $myContentArray[0]['name']?>" src="<?php echo $PLACEWEB_CONFIG['uploadWebDir'].''.$myContentArray[0]['content']['imagePath'];?>" id="eloimg"></div>
	</div>
	<?php 
	// add here the posible answers when the elo is a multiple choice
	if($myContentArray[0]['type'] == 2 )
	{
		$anwersFormHtml = '
		<div id="answers-container">
		<form>';
		for($k=1;$k<=$myContentArray[0]['choices'];$k++)
		{
			$anwersFormHtml .= ' '.$PLACEWEB_CONFIG['questionChoices'][$k].'<input type="radio" name="answer" value="'.$PLACEWEB_CONFIG['questionChoices'][$k].'"/>&nbsp;&nbsp;';	
		}
		$anwersFormHtml .= '
		</form>
		</div>
		';
		echo $anwersFormHtml;
	}
	?>
	
	<div id="posts-list">
	<?php 
		// */
	//echo "<hr>_id: ".$myContentArray[0]['_id'];	
	//echo "<hr>Name: ".$myContentArray[0]['name'];
	//echo "<hr>imagePath: ".$myContentArray[0]['content']['imagePath'];
	//echo "<hr>thumbPath: ".$myContentArray[0]['content']['thumbPath'];
	//echo "<hr>content: ".$myContentArray[0]['content'];


	//echo '<br/><img src="'.$PLACEWEB_CONFIG['uploadWebDir'].''.$myContentArray[0]['content']['thumbPath'].'" width="100" />';
	//echo '<br/><img src="'.$PLACEWEB_CONFIG['uploadWebDir'].''.$myContentArray[0]['content']['imagePath'].'" width="300" />';

	//print_r($myContentArray[0]['discussion']);
	
	//echo "<br/>".$myContentArray[0]['discussion'][0]['$ref'];
	
	$discussionHtml = "";
	
	foreach ($myContentArray[0]['discussion'] as $posts)
	{
		$discussionHtml .= Manager::__getRepliesByRefId($posts['$id']);
		//echo "postID: ".$posts['$id'];
	}

	echo $discussionHtml;

?>
<?php  
		} // end if $eloIdActive!=""
?>

		</div>	<!--  /posts-list -->
		<div class="clear"></div>
		<div id="reply-container">
			<h3>Reply</h3>
			<form method="post" action="index.php?action=discussion">
			<textarea rows="5" cols="25" name="replyText" name="replyText"></textarea>
			<br/>
			<input type="submit" value="Add Comment"/>
			<input type="hidden" name="eloId" id="eloId" value="<?php echo $eloIdActive; ?>"/>
			<input type="hidden" name="postId" id="postId" value=""/>
			<input type="hidden" name="parentType" id="parentType" value=""/>
			<input type="hidden" name="replyPosted" id="replyPosted" value="1"/>
			</form>
		</div>
		<div id="newThread-container">
		<input type="button" value="New Thread" onClick="postNewThread()">
		</div>
	</div>	<!--  /posts elo-discussion -->
	
</div><!-- /discussion-container -->

