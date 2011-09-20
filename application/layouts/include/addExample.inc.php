<?php
require(APPLICATION_PATH.'/configs/config.php');
require(APPLICATION_PATH.'/models/static/'.'PlaceWebTools.php');
//require(APPLICATION_PATH.'/models/ajaxfileuploader/AjaxFileUploader.inc.php');
?>
<script type="text/javascript" src="/jquery/jqueryfileupload/elo_fileuploader.js" ></script>
<h2>Add Example</h2>
<div id="error-dialog" title="Submission Error">
	<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>
 	<span id="error-dialogue-text"></span>
</div>
<div id="home-columns">
	<div id="home-col1" style="float:left;">

	<div id="jp_container_1" class="jp-video jp-video-270p" style="display: none">
			<div class="jp-type-single">
				<div id="jquery_jplayer_1" class="jp-jplayer"></div>
				<div class="jp-gui">
					<div class="jp-video-play">
						<a href="javascript:;" class="jp-video-play-icon" tabindex="1">play</a>
					</div>
					<div class="jp-interface">
						<div class="jp-progress">
							<div class="jp-seek-bar">
								<div class="jp-play-bar"></div>
							</div>
						</div>
						<div class="jp-current-time"></div>
						<div class="jp-duration"></div>
						<div class="jp-title">
							<ul>
								<li>Video</li>
							</ul>
						</div>
						<div class="jp-controls-holder">
							<ul class="jp-controls">
								<li><a href="javascript:;" class="jp-play" tabindex="1">play</a></li>
								<li><a href="javascript:;" class="jp-pause" tabindex="1">pause</a></li>
								<li><a href="javascript:;" class="jp-stop" tabindex="1">stop</a></li>
								<li><a href="javascript:;" class="jp-mute" tabindex="1" title="mute">mute</a></li>
								<li><a href="javascript:;" class="jp-unmute" tabindex="1" title="unmute">unmute</a></li>
								<li><a href="javascript:;" class="jp-volume-max" tabindex="1" title="max volume">max volume</a></li>
							</ul>
							<div class="jp-volume-bar">
								<div class="jp-volume-bar-value"></div>
							</div>

							<ul class="jp-toggles">
								<li><a href="javascript:;" class="jp-full-screen" tabindex="1" title="full screen">full screen</a></li>
								<li><a href="javascript:;" class="jp-restore-screen" tabindex="1" title="restore screen">restore screen</a></li>
								<li><a href="javascript:;" class="jp-repeat" tabindex="1" title="repeat">repeat</a></li>
								<li><a href="javascript:;" class="jp-repeat-off" tabindex="1" title="repeat off">repeat off</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="jp-no-solution">
					<span>Update Required</span>
					To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
				</div>
			</div>

		</div>
		
			
		<div class="dashlet-box-image" id="image-preview">
			<div><img id="eloimg" src="/images/uploader.png" width="320px" height="240px" alt="Drag and Drop a new Media File here..." title="Drag and Drop a new Media File here..."></div>
		</div>
		<form action="/ajax/uploadfile/" method="POST" enctype="multipart/form-data">

		<div  id="fileupload" style="float:left;">
			
				<div class="fileupload-buttonbar">Upload File: <input type="file" name="files[]"> <button type="submit" class="start">Upload</button></div>
								
			
			<div class="fileupload-content">
				<table class="files"></table>
				<div class="fileupload-progressbar"></div>
			</div>
		</div>
		</form>
		<script id="template-upload" type="text/x-jquery-tmpl">
			<tr class="template-upload{{if error}} ui-state-error{{/if}}">
			    <td class="preview"></td>
			    <td class="name">${name}</td>
			    <td class="size">${sizef}</td>
			    {{if error}}
				<td class="error" colspan="2">Error:
				    {{if error === 'maxFileSize'}}File is too big
				    {{else error === 'minFileSize'}}File is too small
				    {{else error === 'acceptFileTypes'}}Filetype not allowed
				    {{else error === 'maxNumberOfFiles'}}Max number of files exceeded
				    {{else}}${error}
				    {{/if}}
				</td>
			    {{else}}
				<td class="progress"><div></div></td>
				<td class="start"><button>Start</button></td>
			    {{/if}}
			    <td class="cancel"><button>Cancel</button></td>
			</tr>
		    </script>
		    <script id="template-download" type="text/x-jquery-tmpl">
			<tr class="template-download{{if error}} ui-state-error{{/if}}">
			    {{if error}}
				<td>&nbsp;</td>
				<td class="name">${name}</td>
				<td class="size">${sizef}</td>
				<td class="error" colspan="2">Error:
				    {{if error === 1}}File exceeds upload_max_filesize 
				    {{else error === 2}}File exceeds MAX_FILE_SIZE (HTML form directive)
				    {{else error === 3}}File was only partially uploaded
				    {{else error === 4}}No File was uploaded
				    {{else error === 5}}Missing a temporary folder
				    {{else error === 6}}Failed to write file to disk
				    {{else error === 7}}File upload stopped by extension
				    {{else error === 'maxFileSize'}}File is too big
				    {{else error === 'minFileSize'}}File is too small
				    {{else error === 'acceptFileTypes'}}Filetype not allowed
				    {{else error === 'maxNumberOfFiles'}}Max number of files exceeded
				    {{else error === 'uploadedBytes'}}Uploaded bytes exceed file size
				    {{else error === 'emptyResult'}}Empty file upload result
				    {{else}}${error}
				    {{/if}}
				</td>
			    {{else}}
				<td class="preview">
				    {{if thumbnail_url}}
					<a href="${url}" target="_blank"><img src="${thumbnail_url}"></a>
				    {{/if}}
				</td>
				<td class="name">
				    <a href="${url}"{{if thumbnail_url}} target="_blank"{{/if}}>${name}</a>
				</td>
				<td class="size">${sizef}</td>
				<td colspan="2"></td>
			    {{/if}}
			    <td class="delete">
				<button data-type="${delete_type}" data-url="${delete_url}">Delete</button>
			    </td>
			</tr>
		    </script>
		
	</div>
	
		
	</div><!-- /home-col1 -->

<form action="/example/add" method="post" id="addExmple" name="addExmple">
	<div id="home-col2" style="float:left;">
		<div class="dashlet-box-simple">
			<div>
				<span class="item-label">Name: </span>
				<span class="item-input"><input type="text" id="example-name" name="name"/></span> 
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
			echo PlaceWebTools::arrayToHtmlCheckBoxList(loadConcepts(), "concept_id_");
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
					<input type="button" onClick="checkExample()" value="Add Example"> <input type="reset" value="Cancel">
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
	<input type="hidden" id="is_video" name="is_video" value="0" />

</form>		
</div>

<?php 
function loadConcepts()
{
	//get all Concepts in db for comparison: which ones are not added yet
	$q = Doctrine_Query::create()
		->select('e.id,  e.name')
		->from('Concept e')
		->where('e.run_id = ?', $_SESSION['run_id']);
	
	$theConcepts = $q->fetchArray();
	
	// adjust the concepts from db 
	foreach($theConcepts as $concept)
	{
		$theConceptsF[$concept['id']] = $concept['name'];
	}
	
	return $theConceptsF;
}
?>
