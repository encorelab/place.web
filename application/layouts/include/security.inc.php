<?php
session_start();

if(!isset($_SESSION['access'])) {
	$_SESSION['access']=false;
	$_SESSION['username']="";
	
	// set authentication ture for testing purposes
	$_SESSION['loginsuccess']=true;
}

/*
 * rollcall here. and set the following vars
 * $_SESSION['username']
 * $_SESSION['profile']
 * $_SESSION['runId']
 * $_SESSION['curnitId'] // if implemented. 
 */
if(isset($_REQUEST['profile']) && $_REQUEST['profile']!="")
{
	$_SESSION['profile']=$_REQUEST['profile'];
}

if(isset($_REQUEST['username']) && $_REQUEST['username']!="")
{
	$_SESSION['username']=$_REQUEST['username'];
//	$_SESSION['author_id'] = 1; // admin
	$_SESSION['author_id'] = 2; // a teacher
//	$_SESSION['author_id'] = 3; // a student
//	$_SESSION['author_id'] = 4; // a student
	
}

// validate authentication with RollCall
if($_SESSION['username']!="" && $_SESSION['loginsuccess'])
{
	$_SESSION['access']=true;
	
	// get this variables ...
	$_SESSION['run_id']="1";
	$_SESSION['curnitId']="9999";
}
?>
