<?php
//print_r($_COOKIE['author_id']);
//session_start();
include('/var/www/mywebapps/PlaceWeb.GitHub/place.web.agamba/application/configs/config.php');


/**
	@name Swampy File and Image Manager (SwampyBrowser) - Sample config file
	@version 1.2
	@author Domas Labokas domas@htg.lt
	@date 2009 04 03
	@see http://www.swampyfoot.com
	@copyright 2009 SwampyFoot
	@license SwampyBrowser is licensed under a Creative Commons Attribution-Noncommercial 3.0
	@license http://creativecommons.org/licenses/by-nc/3.0/
**/
$HOST = $_SERVER['HTTP_HOST'];

// absolute path to your public_html directory
//$PUBLIC_HTML_DIR = $PLACEWEB_CONFIG['uploadDir'].md5($_SESSION['author_id']);
$PUBLIC_HTML_DIR = preg_replace("#content/#i", '', $PLACEWEB_CONFIG['uploadDir']);

// valid image extension
$IMAGE_EXTENSIONS = array("jpg", "jpeg","png", "gif");

/*
	DIRS - directories to use for file and image browsing and uploads
	title - Custom directory title
	dir - directory path in public_html ended with slash
*/

$DIRS = array
(
//	array('title'=>"Gallery images",	'dir'=>"content/images/gallery/user_")
	array('title'=>"My Home Folder",	'dir'=>"content/images/gallery/user_" . $_COOKIE['author_id'] .'/')
	//array('title'=>"Gallery images",'dir'=>"images/gallery/"),
);

	// create directory and set permissions
	$theDir = $PUBLIC_HTML_DIR .  "content/images/gallery/user_" . $_COOKIE['author_id'] .'/';
	@mkdir($theDir, true);
	@chmod($theDir, 0757);
	

/*
	IMAGE_FORMATS - custom image formats for uploading images
	title - format title
	dir - hidden directory for custom formats must start with dot(for being invisible in SwampyBrowser)
	ext - image type and extension. Avaliable formats (png,jpg,gif,false) false means image keeps its orginal extension and image type
	width/height - formated image width/height in pixels.  false meens auto count or leaves orginal
	scale - there are 5 image scale tipes:
		orginal - leaves image in its orginal size
		max - fits image to given size
		addbs - fits image to given size and adds backgroun to keep given size
		crop - crops image to given size
		stretch - stretches image to given size

	bg - is user only with addbg scale type, it specifies color of added background in HTML color code format
	mask - path to mask in public_html dir. It adds mask to the image, can be used to place logos on images,
		mask file must be png image ant fit exact size of given format 
*/

$IMAGE_FORMATS = array
(
	/// DO NOT DELETE THIS (mthumb format is used for generating thumbnails)
	'mthumb' =>	array('title'=>"",	 	'dir' => ".mthumbs/",	'ext'=>"png",'width' => 100,'height' => 100,'mask' => false, 'scale'=>"crop",   'bg'=>"FFFFFF"),
	//custom user predifined format for uploading and formating images
	'original' =>	array('title'=>"Original",	'dir' => "", 	'ext'=>false,'width' => 0,  'height' => 0,  'mask' => false, 'scale'=>"original",'bg'=>"FFFFFF"),
	'gthumb' =>	array('title'=>"Gallery thumb",	'dir' => ".gthumb/",	'ext'=>"png",'width' => 160,'height' => 100,'mask' => false, 'scale'=>"addbg",'bg'=>"FFFFFF"),
);

/* SwampyBrowser language selection (only English is avalible for now)*/
$LANG = "en";


/* You can add here login check because every php script is including this file first before any operation */

?>
