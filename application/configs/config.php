<?php
$PLACEWEB_CONFIG = Array();

// home node title
$PLACEWEB_CONFIG['homeNodeTitle'] = "Physics Learning Across <br/>Contexts and Environments";

// debug mode
//$PLACEWEB_CONFIG['debugMode'] = true; 
$PLACEWEB_CONFIG['debugMode'] = false;

// Authentication mode: in development
//$PLACEWEB_CONFIG['authentication'] = "local";
$PLACEWEB_CONFIG['authentication'] = "rollCall";

// Authentication URL:
$PLACEWEB_CONFIG['rollCallUrl'] = "http://rollcall.aardvark.encorelab.org";
//$PLACEWEB_CONFIG['rollCallUrl'] = "http://rollcall.proto.encorelab.org";

// set ajax uploader
//$PLACEWEB_CONFIG['fileuploader'] = 1; // anto uploader
$PLACEWEB_CONFIG['fileuploader'] = 2; // mike uploader

//FFMPEG path
$PLACEWEB_CONFIG['ffmpegPath'] = '/usr/local/bin/ffmpeg';

// upload directory
// Mike M config
//$PLACEWEB_CONFIG['uploadDir'] = "/var/www/place/content/";

// Antonio Config
//$PLACEWEB_CONFIG['uploadDir'] = "/var/www/mywebapps/PlaceWeb.GitHub/place.web/public/content/";

// server config
$PLACEWEB_CONFIG['uploadDir'] = "/var/www/place/public/content/";

$PLACEWEB_CONFIG['uploadWebDir'] = "/content/";

// Authentication mode: in development
$PLACEWEB_CONFIG['authentication'] = "local";
//$PLACEWEB_CONFIG['authentication'] = "rollCall";


//////////////////////////////////////////////////////////////////

$PLACEWEB_CONFIG['questionChoices'] = array(
	"1" => "A",
	"2" => "B",
	"3" => "C",
	"4" => "D",
	"5" => "E"
);

// Fundamental Concepts
$PLACEWEB_CONFIG['fConcepts'] = array(
	"1" => "Vectors", 
	"2" => "Newton 1st Law",
	"3" => "Newton 2nd Law",
	"4" => "Newton 3rd Law",
	"5" => "Acceleration",
	"6" => "Uniform Motion",
	"7" => "Kinetic Friction",
	"8" => "Static Friction",
	"9" => "Fnet = 0",
	"10" => "Fnet = constant (non-zero)",
	"11" => "Fnet = non-constant",
	"12" => "Kinetic Energy",
	"13" => "Potential Energy",
	"14" => "Conservation of Energy"
);

// types of question
$PLACEWEB_CONFIG['questionTypes'] = array(
	"LONG" => "Question-Narrative", // teacher 
	"MC" => "Question-Multiple Choice", // teacher
);

// Node Types
$PLACEWEB_CONFIG['nodeTypes'] = array(
	"3" => "Photo", 
	"4" => "Video", 
	"5" => "Narrative", 
);
?>
