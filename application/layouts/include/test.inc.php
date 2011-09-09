<?php

// using MongoDAO
$myMongoObj = new MongoDAO();

// test this with one elo
$mongoId = "4e56ca5bbb732b1e31000001";

// testing select by query
	//$theQuery = array("_id" => new MongoId($mongoId));
	//$theQuery = array(); 
	
//testing dot notation
$theQuery = array("_id" => new MongoId($mongoId),"conceptId" => "1");
	
	//$theFields = array("_id", "name");
	$theFields = array(); // get all in the document: a bit of expensive
 

$myEloArray = $myMongoObj->__getByQuery("elos", $theQuery, $theFields); 

print_r($myEloArray);
// testing update 


// push into array
//$myMongoObj->__pushValueIntoArray("elos", $mongoId, $property, $val)

?>