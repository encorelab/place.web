<?php
class Manager
{

	/**
	 * 
	 * Trace in the Mongo Db all my updates/activities
	 * 		this may need to drill down a buch of objects....
	 */
	public static function loadMyUpdates()
	{
		global $PLACEWEB_CONFIG;
			//$myContentArray = Manager::getElo($eloIdActive); // if no id gets all the collection.
		// using MongoDAO
		$myMongoObj = new MongoDAO();
	
		$theQuery = array("author" => $_SESSION['username']);
		$theFields = array("name", "author", "type");
		
		$myContentArray = $myMongoObj->__getByQuery("elo", $theQuery, $theFields);
		
				
	}
	
	/**
	 * 
	 * Enter description here ...
	 * @param $theEloObj
	 */
	public static function saveElo($theEloObj)
	{
		global $PLACEWEB_CONFIG, $db;
		
		var_dump($theEloObj);
		
		$sql = "INSERT INTO `elos` (`id`, `elo_name`, `elo_type_id`, `content_type`, `content_text`, `media_path`, `thumb_path`, `username`, `run_id`) VALUES ";
		$sql .= "";
		
		/*

INSERT INTO `elos` (`id`, `elo_name`, `elo_type_id`, `content_type`, `content_text`, `media_path`, `thumb_path`, `username`, `run_id`) VALUES
(1, 'my first elo', 1, '1', 'the text when this is a questions type text', '/myMediaPath', '/myThumbPath', 'anto', 3);
		 */
		
		$sqlOrder = '';
		$sqlLimit = '';
		
	
	}// end fnc
	
	public static function savePost($theEloObj)
	{
		global $PLACEWEB_CONFIG;
		
		//print_r($theEloObj);

		// create Mongo instance
		$m = new Mongo();
		
		// select a database
			//$db = $m->selectDB($PLACEWEB_CONFIG['db']['DB_NAME']);
		$db = $m->$PLACEWEB_CONFIG['db']['DB_NAME'];
		
			//echo $PLACEWEB_CONFIG['db']['DB_NAME'];
		
		// select a collection 
		$collection = $db->$PLACEWEB_CONFIG['collections']['posts'];

	
		try {
		    $collection->insert($theEloObj, true);
		    return $theEloObj->_id;
		}
		catch(MongoCursorException $e) {
		    echo "Can't save the Post<br/>";
		    return false;
		}
	
	}// end fnc
	
	/**
	 * 
	 * Find a collection with $query and $fields
	 * @param string $theEloId
	 * @param array $theQuery
	 * @param array $theFields
	 */
	public static function getEloByQuery($theEloId, $theQuery,$theFields)
	{
		global $PLACEWEB_CONFIG;
		
		// connect
		$m = new Mongo();
		
		// select a database
		$db = $m->$PLACEWEB_CONFIG['db']['DB_NAME'];
		
		// select a collection 
		$collection = $db->$PLACEWEB_CONFIG['collections']['elo'];
		
		// find by MongoId
			//$cursor = $collection->find(array("_id" => new MongoId($theEloId)));

		$cursor = $collection->find($theQuery,$theFields);
		
		// this does not work: since we need to pass a
		//$cursor = $collection->find(array("_id" => $theEloId));
		
		// find by Regex
		//$cursor = $collection->find(array("name" => new MongoRegex("/Elo746/")));
		
		// find by query and specify which field to select
		//$cursor = $collection->find($theQuery, $theFields);
		//$cursor = $collection->find($theQuery);

		/*
			// Retrieve User ID
			$query = array("name" => "This is my first Elo746");
			$fields = array("_id");
			$cursor = $collection->findOne($query, $fields);
			echo "<hr>Name: ".print_r($cursor);
			*/
		
		
		/*
		 * SELECT * FROM users WHERE name LIKE "%Joe%" 	
		 * $db->users->find(array("name" => new MongoRegex("/Joe/")));
		 */
		//This is my first Elo746
		//echo '<HR>'.$PLACEWEB_CONFIG['collections']['elo'];
		

		// get all the documents
			// $cursor = $collection->find();
		//	/*
		foreach ($cursor as $id => $value) 
		{
		    //echo "$id: ";
		    var_dump( $value );
		}
		//*/
	} // end fnc
	
	public static function getElo0($theEloId)
	{
		global $PLACEWEB_CONFIG;
		
		// connect
		$m = new Mongo();
		
		// select a database
		$db = $m->$PLACEWEB_CONFIG['db']['DB_NAME'];
		
		// select a collection 
		$collection = $db->$PLACEWEB_CONFIG['collections']['elo'];
		
		// find the Elo by ID
		$cursor = $collection->find(array("_id" => new MongoId($theEloId)));
		
		/*
		 * SELECT * FROM users WHERE name LIKE "%Joe%" 	
		 * $db->users->find(array("name" => new MongoRegex("/Joe/")));
		 */
		
		//echo '<HR>'.$PLACEWEB_CONFIG['collections']['elo'];
		

	// get all the documents
		// $cursor = $collection->find();
	foreach ($cursor as $id => $value) 
	{
	    //echo "$id: ";
	    var_dump( $value );
	}

		
		
		//$elo=new Elo($theId, $theName, $theType, $theContent, $theAuthor, $theTags, $thePosts, $theChoices, $theRunId);
	} // end fnc
	
	public static function getElo($theEloId,$theQuery,$theFields)
	{
		global $PLACEWEB_CONFIG;
		
		$resultArray = array();
		
		//echo "<hr>Active Elo: ".$theEloId;
		
		// connect
		$m = new Mongo();
		
		// select a database
		$db = $m->$PLACEWEB_CONFIG['db']['DB_NAME'];
		
		// select a collection 
		$collection = $db->$PLACEWEB_CONFIG['collections']['elo'];
		
		if($theEloId!="")
		{
			// find the Elo by ID
			//$cursor = $collection->find(array("_id" => $theEloId));
			
			// check if there are fields in array
			if(count($theFields)!=0)
			{
				$cursor = $collection->find(array("_id" => new MongoId($theEloId)));
			} else {
				$cursor = $collection->find(array("_id" => new MongoId($theEloId),$theFields));
			}
			
		} else {
			// get all the collection: too expensive... select only what you need
			//$cursor = $collection->find();
			$cursor = $collection->find($theQuery,$theFields);
		}
		
		/*
		 * SELECT * FROM users WHERE name LIKE "%Joe%" 	
		 * $db->users->find(array("name" => new MongoRegex("/Joe/")));
		 */
		
		//echo $PLACEWEB_CONFIG['collections']['elo'];
		
		// get all the documents
		// $cursor = $collection->find();
		///*
		foreach ($cursor as $id => $value) 
		{
		    //echo "$id: ";
		    //var_dump( $value );
		    $resultArray[]= $value;
		}
		//*/
		
		return $resultArray;

	} // end fnc
	
	/**
	 * 
	 * analyzes the tags, sum the votes each tag has, and returns an html <li> list
	 * @param array $tags // this is the array "tags" from an elo
	 */
	public static function __analyzeTags($tags)
	{
		global $PLACEWEB_CONFIG;
		
		$currentTags = array();
		//$PLACEWEB_CONFIG['fConcepts']
		
		$tagsHtml = "";
		$diffTagsHtml = "";
		
		$whoHasVoted = array();
		$conn=0;
		foreach ($tags as $tag)
		{
			// sum votes for each tag
			$votes=0;
			foreach ($tag['votes'] as $vote)
			{
				$votes+=$vote['vote'];
				// collect how has voted  
				$whoHasVoted[]=$vote['author'];
			}
			
			// collect tags for comparison 
			
			$currentTags[$tag['conceptId']] = $tag['tag'];
			$conn++;
			
			//var_dump($tag);
			//echo "<br/>".$tag['conceptId'];
			
			$tagsHtml .='
			<li>
				<div class="tag-name">'.$tag['tag'].'</div>
				<div class"vote-icons">
					<a href="javascript:tagVote(1,'.$tag['conceptId'].')"><img src="images/vote_like.png" width="20px"></a>
					<a href="javascript:tagVote(-1,'.$tag['conceptId'].')"><img src="images/vote_dislike.png" width="20px"></a>
				</div> 
				<div class="tag-votes">'.$votes.'</div>
			</li>';
		}
		
		//var_dump($currentTags);
		
		$diffTags = array_diff($PLACEWEB_CONFIG['fConcepts'], $currentTags);
		
		//print_r($diffTags);
		
		$diffTagsHtml = "
		<li> &nbsp; 
		</li>
		";
		
		foreach ($diffTags as $diffTagId => $diffTagVal)
		{
			$diffTagsHtml .='
			<li>
				<div class="tag-name">'.$diffTagVal.'</div>
				<div class="tag-add"><a href="javascript:addTag(\''.$diffTagId.'\');">[Add]</a></div>
			</li>';
			
			//echo "<br/>".$diffTagId;
		} 
		
		return $tagsHtml.$diffTagsHtml;

	} // end fnc
	
	public static function __getRepliesByRefId($ref)
	{
		$repliesHtml= "";
		
		$myMongoObj = new MongoDAO();
		
		$theQuery = array("_id" => new MongoId($ref));
		$theFields = array("parentType", "author","content","timestamp","votes","replies");
		
		$post = $myMongoObj->__getByQuery("posts", $theQuery, $theFields);
	
		// check if the post has replies, if so call this function again and keep drilling
		//var_dump($post);
		
		//echo "<hr/>Author:".$post[0]['author'];
		
		$repliesHtml .= "
		<ul>";
		
		// add this post data
		$repliesHtml .='
		<li>
		<div class="post-item">

			<div style="float:right;">
				<div class"vote-icons">
					<a href="javascript:postVote(1,\''.$ref.'\')"><img src="images/vote_like.png" width="20px"></a>
					<a href="javascript:postVote(-1,\''.$ref.'\')"><img src="images/vote_dislike.png" width="20px"></a>
				</div> 
			
				<div class="tag-votes">'.'0'.'</div>
			</div>
				
			<div class="post-content">'
				.$post[0]['content'].'
			</div>

			<div class="post-author">	
				Posted by : <a href="#">'.$post[0]['author'].'</a>
			</div>
			
			<div class="post-reply">	
				<a href="javascript: postReply(\''.$ref.'\')">Reply</a>
			</div>
		</div>
		
		
		</li>';

		///*
		if(is_array($post[0]['replies']) && count($post[0]['replies'])!=0)
		{ 
			$repliesHtml .= "
		<li>
				<ul>";
			
			foreach ($post[0]['replies'] as $replies)
			{
				$repliesHtml .= '
					<li>'.Manager::__getRepliesByRefId($replies['$id']).'</li>';
			
				//$repliesHtml .= '<li>'.$replies['$id'].'</li>';
			}
			$repliesHtml .= "
				</ul>
		</li>";
		}
		//*/

				$repliesHtml .= "
		</ul>";
		
		
		return  $repliesHtml;
		
	} // end fnc
}