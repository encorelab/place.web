<?php
// be sure lang is loaded...
?>
<div id="global_header">
<?php
if($_SESSION['access']) 
{
?>
	<div id="header">
		<ul>
			<li>Welcome Back: <strong><?php echo $_SESSION['username']?></strong></li>
			<li><a href="preferences.php">Preferences</a></li>
			<li><a href="home.php">My Home</a></li>
		</ul>
	</div><!-- /header -->
	
	<div id="header-search">
		<form action="#" method="post">
			<ul>
				<li>Search: </li>
				<li><input type="text"/></li>
				<li><a href="logout.php">Sign Out</a></li>
			</ul>	
		</form>
	</div><!-- /header-search -->
<?php 
} else {
?>
		<div id="header"><h1>PLACE.Web</h1></div>
<?php 
} // end if
?>

	<div class="clear"></div>
</div><!-- /global_header -->

