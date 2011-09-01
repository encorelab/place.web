<?php
class MongoDAO
{
	private $mongoDbName; 		// Monto DataBase

	function __construct()
	{

	
	} // end constructor
	
	/**
	 * 
	 * Enter description here ...
	 * @param unknown_type $collectionName
	 * @param unknown_type $mongoId
	 * @param unknown_type $property
	 * @param unknown_type $val
	 */
	public function __pushValueIntoArray($collectionName, $mongoId, $property, $val)
	{
		global $PLACEWEB_CONFIG;

		// create Mongo instance
		$m = new Mongo();
		
		// select a database
		$db = $m->$PLACEWEB_CONFIG['db']['DB_NAME'];
		
		// select a collection 
		$collection = $db->$PLACEWEB_CONFIG['collections'][$collectionName];
		
		$id = new MongoId($mongoId);
		
		//$collection->update(array("_id"=>$id),array('$push' => array($property => $val)));
		$collection->update(array("_id"=>$id),array('$addToSet' => array($property => $val)));
		//array('$addToSet' => array("done_by" => "2"))
		
	} // end fnc
	
	
	/**
	 * 
	 * saves an Object into a collection
	 * @param string $collectionName
	 * @param Object $object // This has been tested only with php objects
	 */
	public function __saveCollection($collectionName, $object)
	{
		global $PLACEWEB_CONFIG;
		
		//print_r($theEloObj);

		// create Mongo instance
		$m = new Mongo();
		
		// select a database
	
		$db = $m->$PLACEWEB_CONFIG['db']['DB_NAME'];
		
		// select a collection 
		$collection = $db->$PLACEWEB_CONFIG['collections'][$collectionName];
		
		try {
	   		$collection->insert($object, true);
		    return $object->_id;
		}
		catch(MongoCursorException $e) {
		    $PLACEWEB_CONFIG['errors'][] =  "Can't save the object into collection: ".$PLACEWEB_CONFIG['collections'][$collectionName]."<br/>ERROR: ".$e;
		    return '';
		}
		
	} // end __saveCollection()
	
	/**
	 * 
	 * Enter description here ...
	 * @param unknown_type $collection
	 * @param unknown_type $objectId
	 */
	public function __getCollection($collection, $objectId)
	{
		global $PLACEWEB_CONFIG;
		
		$resultArray = array();
		
		// create Mongo instance
		$m = new Mongo();
		
		// select a database
		$db = $m->$PLACEWEB_CONFIG['db']['DB_NAME'];
		
		// select a collection 
		$collection = $db->$PLACEWEB_CONFIG['collections'][$collectionName];
		
		if($objectId!="")
		{
			// find object by _id
			$cursor = $collection->find(array("_id" => new MongoId($objectId)));
		} else {
			// get all the collection
			$cursor = $collection->find();
		}

		foreach ($cursor as $id => $value) 
		{
		    $resultArray[]= $value;
		}
		
		return $resultArray;

	} // end __get()
	

	/**
	 * 
	 * Get a collection using a $query and $fields arrays as parameters
	 * @param string $collection
	 * @param array $query
	 * @param array $fields
	 */
	public function __getByQuery($collectionName, $query, $fields)
	{
		global $PLACEWEB_CONFIG;
		
		$resultArray = array();
		
		// create Mongo instance
		$m = new Mongo();
		
		//echo "<hr>".$this->mongoDbName;
		// select a database
		$db = $m->$PLACEWEB_CONFIG['db']['DB_NAME'];
		
		// select a collection 
		$collection = $db->$PLACEWEB_CONFIG['collections'][$collectionName];
		
		//if($objectId!="")
		if(count($fields)!=0)
		{
			// Select only fields in array $fields
			$cursor = $collection->find($query,$fields);
		} else {
			// select all the fields
			$cursor = $collection->find($query);
		}
		
		/*
			// Retrieve User ID
			$query = array("name" => "This is my first Elo746");
			$fields = array("_id");
			$cursor = $collection->findOne($query, $fields);
			echo "<hr>Name: ".print_r($cursor);
			*/

		foreach ($cursor as $id => $value) 
		{
		    $resultArray[]= $value;
		}
		
		return $resultArray;

	} // end __get()
	
	public function __toString()
	{
		$a = "";
		return $a;
	}
	
} // end class

?>
