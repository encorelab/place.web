<?php
// set some testing session


define('SPACEWEB_INCLUDE_PATH', 'include/');
require(SPACEWEB_INCLUDE_PATH.'vitals.inc.php');

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang='en' xml:lang='en' xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php 
//<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
//<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
?>
	<title><?php echo $PLACEWEB_LANG['en']['page_title']?></title>
	<script src="js/basic.js"></script>
	<link href="css/styles.css" rel="stylesheet" type="text/css">
</head>
<body>

<!-- 
<div id="accessible_links">
	<ul>
		<li><a href="#content" title="Skip to content" class="accessible">Skip to content</a></li>
	</ul>
</div>
 -->

<div id="container">
	<?php 
	require(SPACEWEB_INCLUDE_PATH.'header.inc.php');
	?>
	
	<div id="main_content">
		<a name="content"></a>
		<?php 
		require(SPACEWEB_INCLUDE_PATH.'login.form.inc.php');
		?>
	</div><!-- /content -->
		<?php 
		require(SPACEWEB_INCLUDE_PATH.'footer.inc.php');
		?>
</div><!-- /main_container -->
</body>
</html>