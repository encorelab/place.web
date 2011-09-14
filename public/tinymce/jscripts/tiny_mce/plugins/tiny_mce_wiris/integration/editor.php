<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<?php
include 'libwiris.php';
$config = wrs_loadConfig(WRS_CONFIG_FILE);
?>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
		<script type="text/javascript" src="../core/editor.js"></script>
		<title>WIRIS Formula Editor</title>
		
		<style type="text/css">
			/*<!--*/
			
			html,
			body,
			#container {
				height: 100%;
			}
			
			body {
				margin: 0;
			}
			
			#manualLink {
				float: right;
				margin-right: 20px;
			}
			
			applet {
				width: 100%;
			}
			
			/*-->*/
		</style>
	</head>
	<body>
		<div id="container">
			<applet id="applet" codebase="<?php echo $config['wirisformulaeditorcodebase']; ?>" archive="<?php echo $config['wirisformulaeditorarchive']; ?>" code="<?php echo $config['wirisformulaeditorcode']; ?>">
				<param name="menuBar" value="false"/>
				
				<?php
				$params = array(
					'lang' => 'wirisformulaeditorlang',
					'identMathvariant' => 'wirisimageidentmathvariant',
					'numberMathvariant' => 'wirisimagenumbermathvariant',
					'fontIdent' => 'wirisimagefontident',
					'fontNumber' => 'wirisimagefontnumber',
					'version' => 'wirisimageserviceversion'
				);
				
				foreach ($params as $key => $value) {
					if (isset($config[$value])) {
						echo '<param name="' . $key . '" value="' . $config[$value] . '" />';
					}
				}
				
				if (isset($config['wirisimagefontranges'])) {
					$fontRanges = explode(',', $config['wirisimagefontranges']);
					$fontRangesCount = count($fontRanges);
					
					for ($i = 0; $i < $fontRangesCount; ++$i) {
						$fontRangeName = trim($fontRanges[$i]);
						
						if (isset($config[$fontRangeName])) {
							echo '<param name="font' . $i . '" value="' . $config[$fontRangeName] . '" />';
						}
					}
				}
				?>
				
				<p>You need JAVA&reg; to use WIRIS tools.<br />FREE download from <a target="_blank" href="http://www.java.com">www.java.com</a></p>
			</applet>

			<div id="controls">
				<a id="manualLink" href="http://www.wiris.com/portal/docs/editor-manual" target="_blank">Manual &gt;&gt;</a>
			</div>
		</div>
	</body>
</html>