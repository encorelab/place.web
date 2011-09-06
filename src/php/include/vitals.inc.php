<?php
// include 
include_once(PLACEWEB_INCLUDE_PATH.'config.inc.php');

//print_r($SPACEWEB_CONFIG['fConcepts']);

// security layer
include_once(PLACEWEB_INCLUDE_PATH.'security.inc.php');

/////*
// be sure to load the right language
include_once('include/language/es.php');

//print_r($_SESSION);

// class
include_once 'class/Elo.php';
include_once 'class/Concept.php';
include_once 'class/Comment.php';
include_once 'class/Question.php';
include_once 'class/Example.php';

include_once ('class/PlaceWebUtil.static.php');
//include_once ('class/Manager.static.php'); // to be replaced by MongoDAO (class)

include 'class/Manager.static.mongo.php';
//include 'class/Manager.static.mongo.php';

include_once ('class/MongoDAO.php');
include_once ('class/SqlDAO.php');
include_once ('class/ImageManager.php');
//*/

?>