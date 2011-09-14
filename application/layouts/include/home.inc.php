<script>
var servername = "http://<?php echo $_SERVER['SERVER_NAME']; ?>";

$(document).ready(function () {
//  $("#ajax-status").text("The DOM is now loaded and can be manipulated.");
  $("#my-updates").html("<img src='/images/loader.gif'>");
  $("#my-recent-activity").html("<img src='/images/loader.gif'>");
  $("#recent-class-activity").html("<img src='/images/loader.gif'>");

// ajax call for activities
  $("#my-updates").load(servername+"/ajax/myupdates");
  $("#my-recent-activity").load(servername+"/ajax/myactivity");
  $("#recent-class-activity").load(servername+"/ajax/classactivity");
});

</script>

<div id="home-columns">
<?php 
if($_SESSION['profile']=="STUDENT")
{
?>
	<div id="home-col1" style="float:left;width:20%;">
		<div id="comment-score" class="dashlet-box-simple">
			<div class="dashlet-title">Comment Score</div>
			<div>+25</div>
		</div>

		<div id="tag-score" class="dashlet-box-simple">
			<div class="dashlet-title">Tag Score</div>
			<div>+17</div>
		</div>
	</div><!-- /home-col1 -->
<?php 
} // end if student
?>
	
	<div id="home-col2" style="float:left;width:40%;">
		<div id="my-updates" class="dashlet-box">
			<?php 
			//$myUpdates= file_get_contents('http://'.$_SERVER['SERVER_NAME'].'/ajax/myupdates');
			//echo $myUpdates;
			?>
		</div>

		<div id="my-recent-activity" class="dashlet-box">
			<?php 
			//$myActivity= file_get_contents('http://'.$_SERVER['SERVER_NAME'].'/ajax/myactivity');
			//echo $myActivity;
			?>
		</div>	
	</div><!-- /home-col2 -->
	
	<div id="home-col3" style="float:left;width:40%;">
		<div id="recent-class-activity" class="dashlet-box">
			<?php 
	
			//$classActivity= file_get_contents('http://'.$_SERVER['SERVER_NAME'].'/ajax/classactivity');
			//echo $classActivity;
			?>

		</div>	
		<div id="course-actions">
			<div class="dashlet-box"><a href="/example/addform">Create New Example</a></div>
			<?php 
			if($_SESSION['profile']=="TEACHER")
			{
			?>
			<div class="dashlet-box"><a href="/question/addform">Create New Question</a></div>
			<div class="dashlet-box"><a href="/myhome/classlist">See Class List</a></div>
			<?php } // end if teacher?>
			
			<div class="dashlet-box">
				<a href="/web">Launch Associative Web</a>
			</div>
			<?php 
			if($_SESSION['profile']=="TEACHER")
			{
			?>
			<div class="dashlet-box">
				<a href="/question/show">Questions [List]</a>
			</div>
			<?php } // end if teacher?>

			<div class="dashlet-box">
				<a href="/example/show">Examples [List]</a>
			</div>

		</div>	
	</div><!-- /home-col3 -->
	
		
</div><!-- /home-columns-->
