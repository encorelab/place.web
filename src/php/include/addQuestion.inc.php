<?php

// create an elo object: deals with save and update

$myQuestion = new Question();


// collect data if sent
if(isset($_POST['eloSaved']) && $_POST['eloSaved']=="1")
{
	// moving to mysql approach
	
	echo "<hr> Saving Question's posted data";

	//var_dump($_POST);
	print_r($_REQUEST);
	
	//$myQuestion->save($elo_name, $elo_type_id, $content_type, $content_text, $media_path, $thumb_path, $username, $run_id);
	//$myQuestion->save();
	
} // end elo collect data



// be sure that we know what entity is this ELO being attached to ...

// add the first shape of the ELO
	
?>
<script type="text/javascript" src="include/ajaxfileuploader/uploader.js" ></script>
<h2>Add Question</h2>
<div id="home-columns">
	<div id="home-col1" style="float:left;">
		<div id="media_content" class="dashlet-box-image">
			<!--
			<textarea rows="10" cols="10" name="content" id="content"></textarea>  
			<div><img id="eloimg" src="images/test.jpg" width="320px" height="240px" alt="image title" title="image title"></div>
			-->
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
					///ImageManager::generateThumb($PLACEWEB_CONFIG['uploadDir'], "001.png")
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

<form action="<?php echo $_SERVER['PHP_SELF'] ?>?action=addQuestion" method="post" id="addQuestion" name="addQuestion">
	<div id="home-col2" style="float:left;">
		<div class="dashlet-box-simple">
			<div class="dashlet-title"> Basic Info</div>
			<div>
				<span class="item-label">Name: </span>
				<span class="item-input"><input type="text" name="name"/></span> 
			</div>
			<div>
				<span class="item-label">Type: </span>
				<span class="item-input">
				<?php 
				echo PlaceWeb::arrayToHtmlSelect($PLACEWEB_CONFIG['questionTypes'],"", "question_type");
				?>
				</span> 
			</div>
		</div>
		<!-- Multiple Question -->
		<div id="mc-container" class="hide-container" style="float:left;">
			<div class="dashlet-title">Multiple Choices</div>
			<div>
				<select name="mc-list" id="mc-list">
					<option value="0">--</option>
					<option value="1">A</option>
					<option value="2">B</option>
					<option value="3">C</option>
					<option value="4">D</option>
					<option value="5">E</option>
				</select>
			</div>
		</div>
	</div><!-- /home-col2 -->
	
	<div id="home-col3" style="float:left;">
		<div class="dashlet-box-simple">
			<div class="dashlet-title">Tags</div>
			<div>
			<?php 
			echo PlaceWeb::arrayToHtmlCheckBoxList($PLACEWEB_CONFIG['fConcepts'], "concept_id_");
			?>
			</div>
		</div>
	</div><!-- /home-col3 -->
	
	<div class="clear"></div>
	
	<!-- second line container -->
	<div>
		<div class="dashlet-box-simple" style="float:left;">
			<div class="dashlet-title">Content</div>
			<div>
				<textarea rows="10" cols="10" name="post_text" id="post_text"></textarea>
				<div style="text-align:center; margin-top:25px;">
					<input type="submit" value="Add Node"> <input type="reset" value="Cancel">
				</div>   
			</div>
		</div>
	</div>
	<!-- /second line container -->
	
	<!-- some hidden fields, this may be placed here of in $_SESSION array -->

	<input type="hidden" id="media_path" name="media_path" value=""/>
	<input type="hidden" id="thumb_path" name="thumb_path" value=""/>
	<input type="hidden" id="eloSaved" name="eloSaved" value="1"/>
<br/>
<br/>
</form>		
</div>

<script>
// show hide multiple choice container
$('#question_type').change(function() {
	  var str = $("#question_type option:selected").val();
	  if(str=="2") {
	  $("#mc-container").attr("class", "dashlet-box-simple");
	  
	} else {
		$("#mc-container").attr("class", "hide-container");
	}

});
</script>
