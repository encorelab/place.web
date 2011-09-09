<?php
/**
 * This file uploads a file in the back end, without refreshing the page
 *  
 */
@session_start();
//$dirName="uploads";

//include_once '../../application/configs/config.inc.php';
//include_once('../../class/ImageManager.php');

//$dirName=$PLACEWEB_CONFIG['uploadDir'];
$dirName = "/var/www/mywebaps/PlaceWeb.GitHub/zend/public/content/";

if (isset($_POST['id'])) {
	//for security reasons,  hardcode the name of the directrory.	
	$uploadFile=$_GET['dirname']."/".$_FILES[$_POST['id']]['name']; 
	
	//@mkdir($dirName,0777);

	//$uploadFile="$dirName/".md5($_FILES[$_POST['id']]['name'].".demo");
	
	if(!is_dir($_GET['dirname'])) {
		echo '<script> alert("Failed to find the final upload directory: '.$dirName.'");</script>';
	}
	//if (!copy($_FILES[$_POST['id']]['tmp_name'], $dirName.'/'.md5($_FILES[$_POST['id']]['name'].".demo")))
	if (!copy($_FILES[$_POST['id']]['tmp_name'], $dirName.''.$_FILES[$_POST['id']]['name'].""))
	{	
		echo '<script> alert("Failed to upload file");</script>';
	}
} else if (isset($_GET['filename']) && $_GET['filename']!="") {
	// for security reason either remove the extentions or rectrict uploaded not to upload / run scripts like file.php else they can misuse the disk space 
	//$uploadFile=$_GET['dirname']."/".$_GET['filename']; // removed for security reasons (happend with my demo )

	//$uploadFile="$dirName/".md5($_GET['filename'].".demo");
	$uploadFile="$dirName/".$_GET['filename'];
	//$uploadFile=$_GET['dirname']."/".$_FILES[$_POST['id']]['name'];
	
		//echo "<hr>uploadFile: ".$uploadFile;
		//echo "<hr>";

	if (file_exists($uploadFile)) {
		//echo "File uploaded.<br/>".$uploadFile."
		echo "<div style='float:left;'>File uploaded.</div>
		<div style='float:right;'><a href='#'>Upload Again</a></div>
		<div class='clear'></div>"; 
		//<a href='$uploadFile'>Open File</a> &nbsp;&nbsp;&nbsp; <a href='deletefile.php?filename=".$uploadFile."'>Delete File</a>";
		//echo "<br/><br/>Generating Thumb...";
		
		//ImageManager::generateThumb($dirName, $_GET['filename']);
		
	}
	else {
		// it seemt that it never gets here + the container id hidden
		//echo "<img src='loading.gif' alt='loading...' />";
	}
} else {
	echo "Wating for file upload request...";	
	//echo "<img src='loading.gif' alt='loading...' />";
} 

?>
