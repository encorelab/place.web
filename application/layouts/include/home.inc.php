<script>
var servername = "http://<?php echo $_SERVER['SERVER_NAME']; ?>"

$(document).ready(function () {
//  $("#ajax-status").text("The DOM is now loaded and can be manipulated.");
  $("#my-homework-feed").html("<img src='/images/loader.gif' alt='Loading Icon' />")
  $("#my-updates-feed").html("<img src='/images/loader.gif' alt='Loading Icon' />")
  $("#my-recent-activity-feed").html("<img src='/images/loader.gif' alt='Loading Icon' />")
  $("#recent-class-activity-feed").html("<img src='/images/loader.gif' alt='Loading Icon' />")

// ajax call for activities
  $("#my-homework-feed").load(servername+"/ajax/myhomework")
  $("#my-updates-feed").load(servername+"/ajax/myupdates", function(){setupAlertCloseButtons('#my-updates-feed')})
  $("#my-recent-activity-feed").load(servername+"/ajax/myactivity", function(){setupAlertCloseButtons('#my-recent-activity-feed')})
  $("#recent-class-activity-feed").load(servername+"/ajax/classactivity", function(){setupAlertCloseButtons('#recent-class-activity-feed')})
})


function setupAlertCloseButtons(section){
    
    // activity close buttons
    $(section+" .alert-close-btn").click(function(){
        var activityId = $(this).attr('activityId')
        var button = $(this)
        $.post('/ajax/resolve-alert', {'activityId': activityId}, function(data){
            button.parent().slideUp()
        })
    })
}
</script>

<div id="home-columns">
<?php
if($_SESSION['profile']=="STUDENT")
{
?>
	<div id="home-col1" style="float:left;width:20%;">
		<div class="dashlet-box-simple">
			<div class="dashlet-title">Comment Score</div>
			<div class="comment-score"><?php echo $this->commentScore; ?></div>
		</div>

		<div class="dashlet-box-simple">
			<div class="dashlet-title">Tag Score</div>
			<div class="comment-score"><?php echo $this->commentScore;?></div>
		</div>
	</div><!-- /home-col1 -->
<?php 
} // end if student
?>
	
	<div id="home-col2" style="float:left;width:40%;">
<?php 
if($_SESSION['profile']=="STUDENT")
{
?>
	    <div id="my-homework" class="dashlet-box">
			<div class="dashlet-title">My Homework</div>
			<div id="my-homework-feed"></div>
	        
	    </div>
<?php 
} // end if student
?>	    
		<div id="my-updates" class="dashlet-box">
			<div class="dashlet-title">My Updates</div>
			<div id="my-updates-feed"></div>

		</div>

		<div id="my-recent-activity" class="dashlet-box">
			<div class="dashlet-title">My Recent Activity</div>
			<div id="my-recent-activity-feed"></div>
		</div>	
	</div><!-- /home-col2 -->
	
	<div id="home-col3" style="float:left;width:40%;">
		<div id="recent-class-activity" class="dashlet-box">
			<div class="dashlet-title">Recent Class Activity</div>
			<div id="recent-class-activity-feed"></div>

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
