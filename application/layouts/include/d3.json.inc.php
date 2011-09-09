<?php
include_once('config.inc.php');
include_once ('../class/MongoDAO.php');
	
function getNodes()
{

	global $PLACEWEB_CONFIG;
	
	$nodes = array();
	
	///*
	for($i=0;$i<10;$i++)
	{
		$nodes[] = array(
		"name" => "myName_".$i,
		"group"=> "1"
		);
		
	}
	//*/
	
	/*
	// using MongoDAO
	$myMongoObj = new MongoDAO();
	
		//$theQuery = array("_id" => new MongoId($eloIdActive));
	$theQuery = array();
	$theFields = array("_id", "name","type");
		//$theFields = array(); // if empty gets all fields
	
	$myEloArray = $myMongoObj->__getByQuery("elos", $theQuery, $theFields); 
	
	foreach ($myEloArray as $elo)
	{
		$nodes[] = array(
		"name" => $elo["name"],
		"group"=> 1
		);
		
	}
	
	
	
*/
	
	return $nodes;
}

function getLinks()
{
	global $PLACEWEB_CONFIG;

	$links = array();
	
//*
	for($i=0;$i<9;$i++)
	{
		$links[] = array(
		"source" => $i,
		"target"=> rand(0, 9),
		"value" => 1
		);
		
	}
	//*/
	
/*
	$links1[] = array(
	"source" => 1,
	"target"=> 0,
	"value" => 1
	);
/*/		
	return $links;
}
/*
 
{"nodes":[{"name":"Myriel","group":1},{"name":"Napoleon","group":2},{"name":"Mlle.Baptistine","group":3}],"links":[{"source":1,"target":0,"value":1}]}
{"nodes":[{"name":"My Garden","group":"1"},{"name":"My second Elo","group":"1"}],"links":[{"source":1,"target":2,"value":1}]} 
{"nodes":[{"name":"myName_0","group":"1"},{"name":"myName_1","group":"1"},{"name":"myName_2","group":"1"},{"name":"myName_3","group":"1"},{"name":"myName_4","group":"1"},{"name":"myName_5","group":"1"},{"name":"myName_6","group":"1"},{"name":"myName_7","group":"1"},{"name":"myName_8","group":"1"},{"name":"myName_9","group":"1"}],"links":[{"source":0,"target":2,"value":1},{"source":1,"target":6,"value":1},{"source":2,"target":6,"value":1},{"source":3,"target":9,"value":1},{"source":4,"target":0,"value":1},{"source":5,"target":2,"value":1},{"source":6,"target":2,"value":1},{"source":7,"target":2,"value":1},{"source":8,"target":1,"value":1}]} 

{"nodes":[{"name":"My Garden","group":"3"},{"name":"My second Elo","group":"1"}],"links":[{"source":1,"target":0,"value":1}]} 

*/


$myJsonData = array(
	"nodes" => getNodes(),
	"links" => getLinks()
);
$myJson= json_encode($myJsonData);
echo $myJson;
?>