<?php
session_start();
/*
$_SESSION['access']=false;
$_SESSION['username']="";
unset($_SESSION['access']);
unset($_SESSION['username']);
unset($_SESSION['loginsuccess']);
*/
session_destroy();
header('Location: /');
exit;
//echo 'all session destroyed';
//echo '<hr/>$_SESSION var is: <br/>';
//var_dump($_SESSION);	
?>
