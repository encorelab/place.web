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
//$PLACEWEB_CONFIG['uploadDir'] = "/var/www/mywebapps/PlaceWeb.GitHub/place.web.agamba/public/content/";

// server config
$PLACEWEB_CONFIG['uploadDir'] = "/var/www/place/public/content/";

$PLACEWEB_CONFIG['uploadWebDir'] = "/content/";

//////////////////////////////////////////////////////////////////

$PLACEWEB_CONFIG['reAnswerPrompt'] = 'The aggregated Tags of the class are now available to you (Shown in the Tag box - your votes are included). You now have the opportunity to re-answer and re-tag the question. If you do please provide an explanation for your changes (Your Answer and Explanation can both be provided below).';

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
	"1" => "Example", 
	"2" => "Lab Report", 
	"3" => "Investigation", 
	"4" => "Challenge Problem"
);

// Default Answer template
$PLACEWEB_CONFIG['answerTemplate'] = "
	<p><b>1. Provide a brief rationale for why you chose the answer you did.</b></p>
	<p></p>
	<p><b>2. How did examples provided with the question to help you understand and respond to the
	problem?</b></p>
	<p></p>
	<p><b>3. How was each example connected or related to the challenge problem?</b></p>
	<p></p>
	<p><b>Example 1 was related as follows:</b></p>
	<p></p>
	<p><b>Example 2 was related as follows:</b></p>
	<p></p>
	<p><b>Example 3 was related as follows:</b></p>
	<p></p>
	<p><b>Example 4 was related as follows:</b></p>";
?>
