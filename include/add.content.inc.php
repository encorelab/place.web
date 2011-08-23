<?php
// collect data if sent
if(isset($_POST['eloSaved']) && $_POST['eloSaved']=="1")
{
	//echo "<hr> Collecting ELO's posted data";

	//var_dump($_POST);
	//print_r($_POST);
	
	$theId = "";
	$theName = $_POST['eloName'];
	$theType = $_POST['eloType'];
	
	$theContent = array (
	"type" => "image/png",
	"path" => $_POST['uploadedImg']
	);
	
	$theAuthor = $_SESSION['username'];
	 
	$theTags = array();
	
	// check if teacher selected any tags for this elo
	foreach($PLACEWEB_CONFIG['fConcepts'] as $fcId => $fcVal)
	{
		if (isset($_POST['checkbox_'.$fcId]))
		{
			$theTags[]= array(
			"conceptId" => $fcId,
			"tag" => $fcVal,
			"author" => $_SESSION['username'],
			"timestamp" => new MongoTimestamp(),
			"vote" => 0,
			);
		}
	} 
	
	$sampleReply1 = array(
		"author" => "testuser".rand(1,1000),
		"content"=> "sample reply text",
		"timestamp" =>  new MongoTimestamp(),
		"runId" => "Some Run Id",
		"votes" => "",
		"reply" => "",
		"grade" => "",
		"mandatory" => $_POST['mandatory'] 
	);
	
		$sampleReply2 = array(
		"author" => "testuser".rand(1,1000),
		"content"=> "sample reply text",
		"timestamp" =>  new MongoTimestamp(),
		"runId" => "Some Run Id",
		"votes" => "",
		"reply" => $sampleReply1,
		"grade" => "",
		"mandatory" => $_POST['mandatory'] 
		
	);
	
	$theDiscussion = array(
		"author" => $_SESSION['username'],
		"content"=> $_POST['myPost'],
		"date" =>  new MongoTimestamp(),
		"runId" => $_SESSION['runId'],
		"votes" => array(
			"author" => $_SESSION['username'],
			"vote" => 1,
			"timestamp" => new MongoTimestamp(), // this will work as a unique id 
	),
		"reply" => array($sampleReply1,$sampleReply2),
		"grade" => "",
		"mandatory" => $_POST['mandatory'] 
	);
	
	$theChoices = $_POST['mandatory'];
	
	$theRunId = $_SESSION['runId'];
	
	
	// create an Elo Object
	$myNewElo = new Elo($theId, $theName, $theType, $theContent, $theAuthor, $theTags, $theDiscussion, $theChoices, $theRunId);
	// Elo first insert
		
	Manager::saveElo($myNewElo);
	header('Location: home.php');
}



// be sure that we know what entity is this ELO being attached to ...

// add the first shape of the ELO
	
?>
<div id="home-columns">
	<div id="home-col1" style="float:left;">
		<div class="dashlet-box-image">
			<div><img id="eloimg" src="images/test.jpg" width="320px" height="240px" alt="image title" title="image title"></div>
		</div>
		
		<div class="dashlet-box-simple" style="float:left;">
			<div class="dashlet-title">Upload File</div>
			<div id="traceUpload"></div>
				<?php
					$uploaderURL = "include/ajaxfileuploader/";
					//$uploaderURL = "";
					//$uploadDirectory="/var/www/mywebaps/PLACE.web/include/ajaxfileuploader/uploads";
					
					$uploadDirectory=$PLACEWEB_CONFIG['uploadDir'];
					
					require_once("include/ajaxfileuploader/AjaxFileUploader.inc.php");
					$ajaxFileUploader = new AjaxFileuploader($uploadDirectory);	
					echo $ajaxFileUploader->showFileUploader('id1',$uploaderURL);

					// show files available in upload directory
					/*
					$myFiles = array();
					$myFiles = $ajaxFileUploader->getAllUploadedFiles(); 
					foreach ($myFiles as $fName)
					{
						echo $fName.'<br/>';
						
					}
					*/
				?>
		</div>
		
	</div><!-- /home-col1 -->

<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" id="eloBasic" name="eloBasic">
	<div id="home-col2" style="float:left;">
		<div class="dashlet-box-simple" style="float:left;">
			<div class="dashlet-title">ELO Basic Info</div>
			<div>
				<span class="item-label">Name: </span>
				<span class="item-input"><input type="text" name="eloName"/></span> 
			</div>
			<div>
				<span class="item-label">Type: </span>
				<span class="item-input">
				<?php 
				echo SpaceUtil::arrayToHtmlSelect($PLACEWEB_CONFIG['nodeTypes'],"", "eloType");
				?>
				</span> 
			</div>
		</div>

	</div><!-- /home-col2 -->
	
	<div id="home-col3" style="float:left;">
		<div class="dashlet-box-simple">
			<div class="dashlet-title">Tags</div>
			<div>
			<?php 
			echo SpaceUtil::arrayToHtmlCheckBoxList($PLACEWEB_CONFIG['fConcepts'], "checkbox");
			?>
			</div>
		</div>
	</div><!-- /home-col3 -->
	
	<div class="clear"></div>
	
	<!-- second line container -->
	<div>
		<div class="dashlet-box-simple" style="float:left;">
			<div class="dashlet-title">HTML Editor</div>
			<div>
				<textarea rows="10" cols="10" name="myPost" id="myPost"></textarea>
				<div style="text-align:center; margin-top:25px;">
					<input type="submit" value="Add Node"> <input type="reset" value="Cancel">
				</div>   
			</div>
		</div>
	</div>
	<!-- /second line container -->
	
	<!-- some hidden fields, this may be placed here of in $_SESSION array -->
	<h3>Some hidden fields</h3>
	<input type="text" id="uploadedImg" name="uploadedImg" value="uploadedImg"/>
	<input type="hidden" id="parentId" name="parentId" value="parentId"/>
	<input type="hidden" id="parentType" name="parentType" value="parentType"/>

	<input type="hidden" id="eloSaved" name="eloSaved" value="1"/>

</form>		
</div>
