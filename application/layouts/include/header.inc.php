<?php
// be sure lang is loaded...
?>
<div id="global_header">
<?php
if(isset($_SESSION['access']))
{
?>
	<h1 id="project-name">Physics Learning Across Contexts &amp; Environments</h1>
	<div id="header">
		<ul>
			<li class="left">welcome back <strong><?php echo $_SESSION['username']?></strong></li>
			<li class="right"><a href="/myhome">home</a></li>
			<li class="right"><a href="/myhome/preferences">preferences</a></li>
		</ul>
	</div><!-- /header -->
	
	<div id="header-search">
		<form action="#" method="post">
			<ul>
				<li class="right">search </li>
				<li class="right"><input type="text"/></li>
				<li class="right"><a href="/logout.php">sign out</a></li>
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

