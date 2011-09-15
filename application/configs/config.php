<?php
$PLACEWEB_CONFIG = Array();

// debug mode
$PLACEWEB_CONFIG['debugMode'] = true; 
// $PLACEWEB_CONFIG['debugMode'] = false;


// upload directory
$PLACEWEB_CONFIG['uploadDir'] = "/var/www/mywebaps/PlaceWeb.GitHub/place.web/public/content/";
$PLACEWEB_CONFIG['uploadWebDir'] = "/content/";



//////////////////////////////////////////////////////////////////

$PLACEWEB_CONFIG['includePath'] = "include/"; 

$PLACEWEB_CONFIG['errors'] = array();



$PLACEWEB_CONFIG['questionChoices'] = array(
	"1" => "A",
	"2" => "B",
	"3" => "C",
	"4" => "D",
	"5" => "E"
);


// courses
$PLACEWEB_CONFIG['courses'] = array(
	"courseId" => "SPH3UE",
	"courseName" => "Grade 11 Physics",
	"coursetUnits" => array(
	"Kinematics",
	"Dynamics",
	"Unit1",
	"Unit2",
	)
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

// Equation objects
$PLACEWEB_CONFIG['equations'] = array();

$PLACEWEB_CONFIG['equations'][] = array(
	array("courseId" =>"xxxx1"), 
	array("equID" => "myEquIdxx", 
		"equ" => array ("Equation text", "Equation img", "Equation text/description"))
);


?>
