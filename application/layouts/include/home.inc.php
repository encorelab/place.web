<?php

?>
<div id="home-columns">
<?php 
// if student
if($_SESSION['profile']=="STUDENT")
{
?>
<!-- home-col1 -->
	<div id="home-col1" style="float:left;width:20%;">
		<div id="comment-score" class="dashlet-box-simple">
			<div class="dashlet-title">Comment Score</div>
			<div>+25</div>
		</div>

		<div id="tag-score" class="dashlet-box-simple">
			<div class="dashlet-title">Tag Score</div>
			<div>+17</div>
		</div>
	</div>
<!-- /home-col1 -->
<?php 
} // end if student
?>

<!-- home-col2 -->
	<div id="home-col2" style="float:left;width:40%;">


		<!-- course-actions -->
		<div id="course-actions">
			<div class="activity-link"><a href="/example/addform">Create New Example</a></div>
			<?php 
			if($_SESSION['profile']=="TEACHER")
			{
			?>
			<div class="activity-link"><a href="/question/addform">Create New Question</a></div>
			<div class="activity-link"><a href="/myhome/classlist">See Class List</a></div>
			<?php } // end if teacher?>
			
			<div class="activity-link">
				<a href="/web">Launch Associative Web</a>
			</div>

			<div class="dashlet-box">
				<a href="/discussion">[test] examples list</a>
			</div>
		</div>
		<!-- /course-actions -->


	</div>
<!-- /home-col2 -->

<!-- home-col3 -->
	<div id="home-col3" style="float:left;width:40%;">

		<!-- recent-class-activity -->
		<div id="recent-class-activity" class="dashlet-box">
			<?php 
			$classActivity= file_get_contents('http://'.$_SERVER['SERVER_NAME'].'/ajax/classactivity');
			echo $classActivity;
			?>
		</div>	
		<!-- /recent-class-activity -->

	</div>
<!-- /home-col3 -->
	
		
</div><!-- /home-columns-->
