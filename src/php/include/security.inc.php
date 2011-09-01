<?php
session_start();
if(!isset($_SESSION['access'])) {
	$_SESSION['access']=false;
	$_SESSION['username']="";
	
	// set authentication ture for testing purposes
	$_SESSION['loginsuccess']=true;
}



/*
 * if $_SESSION[''].. and so...
 */

if(isset($_REQUEST['username']) && $_REQUEST['username']!="")
{
	$_SESSION['username']=$_REQUEST['username'];
}

// validate authentication with RollCall
if($_SESSION['username']!="" && $_SESSION['loginsuccess'])
{
	$_SESSION['access']=true;
	
	// get this variables ...
	$_SESSION['runId']="runId123";
	$_SESSION['curnitId']="curnitId321";
}
?>
