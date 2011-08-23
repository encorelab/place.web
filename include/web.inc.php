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

$myEloArray = $myMongoObj->__getByQuery("elo", $theQuery, $theFields); 
 
//Manager::getElo(''); // if no id gets all the collection.

//$myMapArray = Manager::getElo(''); // if no id gets all the collection.

//print_r($myMapArray);
$myMapHtml="
<ul>";
?>

<div id="web-container">		

	<div id="web-actions" style="text-align:right;">
		... add here all the actions we need to test on an elo
		<br/>
		<a href="#">View Tags</a> |
		<a href="#">View Comments</a> |

	</div>

<div id="elo-details" style="float:right;">
	<iframe width="500" height="300" src="" name="iframeid1"></iframe>
</div>

<?php 


foreach ($myEloArray as $elo)
{
	$myMapHtml.= "<li><a href='get.content.php?eloId=".$elo['_id']."' target='iframeid1'>".$elo['name']."</a></li>";
}
$myMapHtml.="
</ul>


";

echo $myMapHtml;

$myJson = json_encode($myEloArray);
//var_dump($myJson);

 
?>
<textarea rows="10" cols="60"><?php echo $myJson;?></textarea>

</div><!-- /web-container -->
