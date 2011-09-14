<?php
require(APPLICATION_PATH.'/configs/config.php');
require(APPLICATION_PATH.'/models/static/'.'PlaceWebTools.php');
require(APPLICATION_PATH.'/models/ajaxfileuploader/AjaxFileUploader.inc.php');
?>
<script type="text/javascript" src="/ajaxfileuploader/uploader.js" ></script>
<h2>Add Question</h2>
<div id="home-columns">
	<div id="home-col1" style="float:left;">
		<div id="media_display" class="dashlet-box-image">
			<img src="/images/test.jpg" width="320px" height="240px" alt="image title" title="image title">
		</div>
		
		<!-- Uploader container -->
		<div class="dashlet-box-simple" style="float:left;">
			<div class="dashlet-title">Upload File</div>
			<div id="traceUpload"></div>
			
				<?php
					$uploaderURL = "/ajax/uploadfile";
					//$uploaderURL = "";
					//$uploadDirectory="/var/www/mywebaps/PLACE.web/include/ajaxfileuploader/uploads";
					
					$uploadDirectory=$PLACEWEB_CONFIG['uploadDir'];
					//echo $uploadDirectory;
					
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
		<!-- /Uploader container -->
		
	</div><!-- /home-col1 -->

<form action="/question/add" method="post" id="addQuestion" name="addQuestion">
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
				//echo PlaceWebTools::arrayToHtmlSelect($PLACEWEB_CONFIG['questionTypes'],"", "type");
				echo PlaceWebTools::arrayToHtmlSelect($this->questionTypes,"", "question_type");
				?>
				</span> 
			</div>
			<div>
				<span class="item-label">Status: </span>
				<span class="item-input">
					<select name="status">
						<option value="1">Active</option>
						<option value="0">Inactive</option>
					</select>
				</span> 
			</div>
		</div>
		<!-- Multiple Question -->
		<div id="mc-container" class="hide-container" style="float:left;">
			<div class="dashlet-title">Multiple Choices</div>
			<div>
				<select name="mc-list" id="mc-list">
					<option value="0">--</option>
					<option value="1">A : 1</option>
					<option value="2">B : 2</option>
					<option value="3">C : 3</option>
					<option value="4">D : 4</option>
					<option value="5">E : 5</option>
				</select>
			</div>
		</div>
	</div><!-- /home-col2 -->
<!-- 
	<div id="home-col3" style="float:left;">
		<div class="dashlet-box-simple">
			<div class="dashlet-title">Tags</div>
			<div>
 
			<?php 
			//echo PlaceWebTools::arrayToHtmlCheckBoxList($this->fConcepts, "concept_id_");
			?>
			</div>
		</div>
	</div>
	-->
	<!-- /home-col3 -->
	
	<div class="clear"></div>
	
	<!-- second line container -->
	<div>
		<div class="dashlet-box-simple" style="float:left;">
			<div class="dashlet-title">Content</div>
			<div>
				<textarea rows="10" cols="10" name="content" id="content"></textarea>
				<div style="text-align:center; margin-top:25px;">
					<input type="submit" value="Add Question"/>
					<input type="reset" value="Cancel"/>
				</div>   
			</div>
		</div>
	</div>
	<!-- /second line container -->
	
<div class="clear"></div>

<!-- some hidden fields, this may be placed here of in $_SESSION array / json Obj-->
	<input type="text" id="media_path" name="media_path" value=""/>
	<input type="text" id="thumb_path" name="thumb_path" value=""/>
	<input type="hidden" id="saved" name="saved" value="1"/>
	<input type="text" id="media_content" name="media_content" value="" />
	<input type="text" id="media_type" name="media_type" value="" />
</form>		
</div>
<!-- add some custom jquery here  ... merge !-->
<script>
// show hide multiple choice container
$('#question_type').change(function() {
	  var str = $("#question_type option:selected").val();
	  if(str=="MC") {
	  $("#mc-container").attr("class", "dashlet-box-simple");
	  
	} else {
		$("#mc-container").attr("class", "hide-container");
	}

});
</script>