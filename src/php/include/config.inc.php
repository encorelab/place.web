<?php

// database
define('DB_USER', 'root');
define('DB_PASSWORD', 'anto123');
define('DB_HOST', 'localhost');
define('DB_PORT', '3306');
define('DB_NAME', 'placeweb');


/* connect to mysql database */	
$db = mysql_connect(DB_HOST . ':' . DB_PORT, DB_USER, DB_PASSWORD);
if (!$db) {
	trigger_error('VITAL#Unable to connect to db.', E_USER_ERROR);
	exit;
}
if (!mysql_select_db(DB_NAME, $db)) {
	trigger_error('VITAL#DB connection established, but database "'.DB_NAME.'" cannot be selected.', E_USER_ERROR);
	exit;
}

$PLACEWEB_CONFIG = Array();

$PLACEWEB_CONFIG['errors'] = array();

// upload directory
$PLACEWEB_CONFIG['uploadDir'] = "/var/www/mywebaps/PlaceWeb.GitHub/place.web/src/php/_uploadedContent/";
$PLACEWEB_CONFIG['uploadWebDir'] = "_uploadedContent/";

//

/*
// database mysql
$PLACEWEB_CONFIG['db'] = array(
	'DB_USER' => 'root',
	'DB_PASSWORD' => 'anto123',
	'DB_HOST' => 'localhost',
	'DB_PORT' => '3306',
	'DB_NAME' => 'placeWebDb');

*/

$PLACEWEB_CONFIG['elos'] = array(
	"id",
	"elo_name",
	"elo_type_id",
	"content_type",
	"content_text",
	"media_path",
	"thumb_path",
	"username",
	"run_id"
);

//database mongo

$PLACEWEB_CONFIG['collections'] = array(
	"elos" 		=> "elosCollection",
	"posts" 	=> "postsCollection",
	"activity"	=> "activityCollection",
	"concepts" 	=> "conceptsCollection",
	"tags"		=> "tagsCollection",
	"courses"	=> "coursesCollection",
);

$PLACEWEB_CONFIG['questionChoices'] = array(
	"1" => "A",
	"2" => "B",
	"3"	=> "C",
	"4"	=> "D",
	"5"	=> "E"
);

///////////////////////////////////////////////////////
/*
 * This data will come from somewhere else ;)
 * 
 */
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

// Node Types
$PLACEWEB_CONFIG['nodeTypes'] = array(
	"1" => "Homework-Question-text", // teacher 
	"2" => "Homework-Question-Multiple Choice", // teacher
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