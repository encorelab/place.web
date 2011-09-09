<?php
if(isset($_REQUEST['eloId']))
{
	$eloIdActive = $_REQUEST['eloId'];
} else {
	$eloIdActive = "";
}

// using MongoDAO
$myMongoObj = new MongoDAO();

	//$theQuery = array("_id" => new MongoId($eloIdActive));
$theQuery = array();
$theFields = array("_id", "name");
	//$theFields = array(); // if empty gets all fields

$myEloArray = $myMongoObj->__getByQuery("elos", $theQuery, $theFields); 
 
//Manager::getElo(''); // if no id gets all the collection.

//$myMapArray = Manager::getElo(''); // if no id gets all the collection.

//print_r($myMapArray);
$myMapHtml="
<ul>";

foreach ($myEloArray as $elo)
{
	$myMapHtml.= "
		<li><a href='".$_SERVER['PHP_SELF']."?action=web&eloId=".$elo['_id']."'>".$elo['name']."</a></li>";
}
$myMapHtml.="
</ul>";

?>
<div id="web-container">

	<div id="elos-container" style="float:left; width:15%;">
	<h1>Elos</h1>
	<?php 
	echo $myMapHtml;
	//$myJson = json_encode($myEloArray);
	//var_dump($myJson);
	// 
	?>
	</div><!-- /elos-container -->
	

	<div style="float: right; width: 75%; border: 2px dashed rgb(0, 0, 0); padding: 1em;" id="elo-details">
		
		<?php 
		require 'include/d3.inc.php';
//		require 'include/d3.json.inc.php';
		
		?>
		<?php 
		
		if($eloIdActive!="")
		{
			$myMongoObj = new MongoDAO();
		
			$theQuery = array("_id" => new MongoId($eloIdActive));
			//$theFields = array("name", "content","discussion");
			$theFields = array(); // and empty array triggers a selection of all fields
			
			$myContentArray = $myMongoObj->__getByQuery("elos", $theQuery, $theFields);			
			echo "<h3>Data</h3>";
			echo '<textarea rows="20" cols="80">';
			var_dump($myContentArray);
			echo '</textarea>';
			
		} // end if
		?>
	</div>
</div><!-- /web-container -->
