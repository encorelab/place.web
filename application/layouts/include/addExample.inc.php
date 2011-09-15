<?php
require(APPLICATION_PATH.'/configs/config.php');
require(APPLICATION_PATH.'/models/static/'.'PlaceWebTools.php');
require(APPLICATION_PATH.'/models/ajaxfileuploader/AjaxFileUploader.inc.php');
?>
<script type="text/javascript" src="/ajaxfileuploader/uploader.js" ></script>
<h2>Add Example</h2>
<div id="home-columns">
	<div id="home-col1" style="float:left;">
		<div id="media_display" class="dashlet-box-image">
			<img src="/images/test.jpg" width="320px" height="240px" alt="image title" title="image title">
		</div>

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
		
	</div><!-- /home-col1 -->

<form action="/example/add" method="post" id="addExmple" name="addExmple">
	<div id="home-col2" style="float:left;">
		<div class="dashlet-box-simple">
			<div>
				<span class="item-label">Name: </span>
				<span class="item-input"><input type="text" name="name"/></span> 
			</div>
			<div>
				<span class="item-label">Type: </span>
				<span class="item-input">
				<?php 
				echo PlaceWebTools::arrayToHtmlSelect($PLACEWEB_CONFIG['nodeTypes'],"", "type");
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
			echo PlaceWebTools::arrayToHtmlCheckBoxList($PLACEWEB_CONFIG['fConcepts'], "concept_id_");
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
				<textarea rows="10" cols="10" name="content" id="content"></textarea>
				<div style="text-align:center; margin-top:25px;">
					<input type="submit" value="Add Example"> <input type="reset" value="Cancel">
				</div>   
			</div>
		</div>
	</div>
	<!-- /second line container -->
	
	<!-- some hidden fields, this may be placed here of in $_SESSION array -->
	<input type="hidden" id="media_path" name="media_path" value=""/>
	<input type="hidden" id="thumb_path" name="thumb_path" value=""/>
	<input type="hidden" id="saved" name="saved" value="1"/>
	<input type="hidden" id="media_content" name="media_content" value="" />
	<input type="hidden" id="media_type" name="media_type" value="" />

</form>		
</div>