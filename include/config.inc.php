<?php

$PLACEWEB_CONFIG = Array();

$PLACEWEB_CONFIG['errors'] = array();

// upload directory
$PLACEWEB_CONFIG['uploadDir'] = "/var/www/place/_uploadedContent/";
//
// database mysql
$PLACEWEB_CONFIG['db'] = array(
	'DB_USER' => 'root',
	'DB_PASSWORD' => 'anto123',
	'DB_HOST' => 'localhost',
	'DB_PORT' => '3306',
	'DB_NAME' => 'placeWebDb');

//database mongo

$PLACEWEB_CONFIG['collections'] = array(
	"elo" 		=> "eloCollection",
	"concepts" 	=> "conceptsCollection",
	"tags"		=> "tagsCollection",
	"events"	=> "eventsCollection",
	"courses"	=> "coursesCollection",
);

///////////////////////////////////////////////////////
/*
 * This data will come from somewhere else ;)
 * 
 */


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

// Node Types
$PLACEWEB_CONFIG['nodeTypes'] = array(
	"1" => "Homework-Question-Long", // teacher 
	"2" => "Homework-Question-Mc", // teacher
	"3" => "Photo", // student and theacher 
	"4" => "Video", // student and theacher 
	"5" => "Narrative", // student and theacher 
);

// Equation objects
$PLACEWEB_CONFIG['equations'] = array();

$PLACEWEB_CONFIG['equations'][] = array(
	array("courseId" =>"xxxx1"), 
	array("equID" => "myEquIdxx", 
		"equ" => array ("Equation text", "Equation img", "Equation text/description"))
);

//var_dump($PLACEWEB_CONFIG['equations']);

?>
