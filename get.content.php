<?php
// load vitals
define('SPACEWEB_INCLUDE_PATH', 'include/');
require(SPACEWEB_INCLUDE_PATH.'vitals.inc.php');

$myContentArray = array();

if(isset($_REQUEST['eloId']))
{
	$eloIdActive = $_REQUEST['eloId'];
} else {
	$eloIdActive = "";
}

if(isset($_REQUEST['action']))
{
	$action = $_REQUEST['action'];
} else {
	$action = "";
}
?>

<?php 
if ($eloIdActive!="") {
	//echo "Active Elo: ".$eloIdActive;
	
	//$myContentArray = Manager::getElo($eloIdActive); // if no id gets all the collection.
	// using MongoDAO
	$myMongoObj = new MongoDAO();

	$theQuery = array("_id" => new MongoId($eloIdActive));
	$theFields = array("name", "content");
	
	$myContentArray = $myMongoObj->__getByQuery("elo", $theQuery, $theFields);

		// /*
	foreach ($myContentArray as $value)
	{
		//echo "<hr>".print_r($value);

	}
		// */
	echo "<hr>_id: ".$myContentArray[0]['_id'];	
	echo "<hr>Name: ".$myContentArray[0]['name'];
	echo "<hr>Path: ".$myContentArray[0]['content']['path'];
	
	echo '<br/><img src="'.$myContentArray[0]['content']['path'].'" width="100" />';
	
	//print_r($myContentArray);
}
?>
