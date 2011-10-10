<?php
// be sure lang is loaded...
?>
<div id="global_header">
<?php
if(isset($_SESSION['access'])) 
{
?>
	<div id="header-top">
		<img src="/images/placeweb.png" alt="Place Web logo" />
		<div id="project-name">Physics Learning Across Contexts &amp; Environments</div>
	</div>
	<div id="header-bottom">
		<div id="header">
			<div id="welcome">welcome back <span><?php echo $_SESSION['user_display_name']?></span></div>
		</div><!-- /header -->
		<div id="header-links-container">
			<div id="header-links">	
				<ul>
					<li class="header-li"><a href="/myhome">home</a></li>
					<li class="header-li"><a href="#" onClick="loadWeb()">web</a></li>
					<li class="header-li"><a href="/myhome/preferences">preferences</a></li>
					<li id="search-li"><form action="#" method="post"><label for="search">search </label><input type="text" id="search" /></form></li>
					<li class="header-li"><a href="/user/logout">sign out</a></li>
				</ul>
			</div>	
		</div><!-- /header-links-container -->
	</div>
<?php 
} else {
?>
	<div id="header-top">
		<img src="/images/placeweb.png" alt="Place Web logo" />
		<div id="project-name">Physics Learning Across Contexts &amp; Environments</div>
	</div>
<?php 
} // end if
?>

	<div class="clear"></div>
</div><!-- /global_header -->

