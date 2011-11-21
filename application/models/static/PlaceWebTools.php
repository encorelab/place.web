<?php
class PlaceWebTools
{
	public static function getCurrentDate()
	{
		$d = date("m.d.Y H:i:s");
		return $d;
		
	} // end _getCurrentDate()
	
	/**
	 * 
	 * Generates a <select> object from an array
	 * @param array $dataAr
	 * @param String $selectedVal
	 * @param String $name
	 */
	public static function arrayToHtmlSelect($dataAr, $selectedVal, $name)
	{
		$html = '
		<select id="'.$name.'" name="'.$name.'">';

		foreach($dataAr as $val => $name)
		{
			if($val==$selectedVal)
			{
				$selected=' selected="selected"';
			} else {
				$selected="";
			}
	
			$html .= '
				<option '.$selected.' value="'.$val.'">'.$name.'</option>';
		}
	
		$html.='</select></span>';
		
		return $html;
		
	} // end arrayToHtmlSelect()
	
	/**
	 * 
	 * Generates a list of checkboxes
	 * @param array $dataAr
	 * @param String $namePrefix
	 */
	public static function arrayToHtmlCheckBoxList($dataAr, $namePrefix)
	{
		$html = '
		<ul class="ul-for-data">';

		foreach($dataAr as $val => $name)
		{
	
			$html .= '
				<li><input class="tag-checkbox" type="checkbox" name="'.$namePrefix.'_'.$val.'" value="'.$name.'"/>'.$name.'</li>';
		}
	
		$html.='
		</ul>';
		
		return $html;
		
	} // end arrayToHtmlSelect()

	public static function showImgVideoPlayer($dataArray)
	{
			$mediaFile = current($dataArray);
			$html='';
			// need the determine the media type here
			
			if (preg_match("/video/i", $mediaFile['media_type']))
			{
				$html.='
			<div class="dashlet-box-image">
	          <div class="dashlet-title">'. $dataArray[0]['name'].'</div>
				<div id="jp_container_1" class="jp-video jp-video-270p">
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
	                                                                <li>' . $mediaFile['name'] . '</li>
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
		</div>
			<script>
				$("#jquery_jplayer_1").jPlayer({
	                                        ready: function() { // The $.jPlayer.event.ready event
	                                           $(this).jPlayer("setMedia", { m4v: "' . $mediaFile['media_content'] .  '" }); //.jPlayer("play");
	                                        },
	                                        ended: function() { // The $.jPlayer.event.ended event
	                                            //$(this).jPlayer("play"); // Repeat the media
	                                        },
	                                        size: {
	                                                            width: "460px",
	                                                            height: "270px",
	                                                            cssClass: "jp-video-270p"
	                                                    },
	
	                                     solution:"html, flash",
	                                     swfPath: "/jquery/jplayer",
	                                     supplied: "m4v",
	                                     errorAlerts: true
	                                    });
			</script>
				';
	
				$html.= "<br/>";
				
			} else { 
				
	$html.= '
	<div class="dashlet-box-image">
	    <div class="dashlet-title">'. $dataArray[0]['name'].'</div>
		<div class="image-holder"><img src="/content/'. $dataArray[0]['media_path'].'" title="'. $dataArray[0]['name'].'" width="320px" /></div>
	</div>';
			}
			
			return $html;
	} // end fnc
	
} // end class
