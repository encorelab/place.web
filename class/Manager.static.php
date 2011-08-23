<?php
class Manager
{
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
	
	public static function saveElo($theEloObj)
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
		$collection = $db->$PLACEWEB_CONFIG['collections']['elo'];

		// add object
			//$obj = array( "title" => "Calvin and Hobbes", "author" => "Bill Watterson" );
		//$collection->insert($theEloObj);
		
		//$collection->remove(array("z" => "abc"));
		//$collection->remove(array("name" => new MongoRegex("/This is my first/")));
		
		/*
		 * SELECT * FROM users WHERE name LIKE "%Joe%" 	
		 * $db->users->find(array("name" => new MongoRegex("/Joe/")));
		 */
		
		try {
		    $collection->insert($theEloObj, true);
		    return $theEloObj->_id;
		}
		catch(MongoCursorException $e) {
		    echo "Can't save the ELO <br/>";
		    return false;
		}

		// find everything in the collection
		//$cursor = $collection->find();
		//var_dump($collection);
		
		// iterate through the results
		/*
		foreach ($cursor as $obj) 
		{
		    echo $obj["_id"]." ::: ".$obj["name"] . "<br/>";
		}
		*/
			//echo '<hr>'.$PLACEWEB_CONFIG['collections']['elo'];
		
			//echo  "<br/>ID:". $theEloObj->_id;		
		
		
	
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
			$cursor = $collection->find();
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
}