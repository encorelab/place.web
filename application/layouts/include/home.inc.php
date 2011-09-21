<script>
var servername = "http://<?php echo $_SERVER['SERVER_NAME']; ?>"

$(document).ready(function () {
//  $("#ajax-status").text("The DOM is now loaded and can be manipulated.");
  $("#my-updates").html("<img src='/images/loader.gif'>")
  $("#my-recent-activity").html("<img src='/images/loader.gif'>")
  $("#recent-class-activity").html("<img src='/images/loader.gif'>")

// ajax call for activities
  $("#my-homework").load(servername+"/ajax/myhomework")
  $("#my-updates").load(servername+"/ajax/myupdates", function(){setupAlertCloseButtons('#my-updates')})
  $("#my-recent-activity").load(servername+"/ajax/myactivity", function(){setupAlertCloseButtons('#my-recent-activity')})
  $("#recent-class-activity").load(servername+"/ajax/classactivity", function(){setupAlertCloseButtons('#recent-class-activity')})
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
		<div id="comment-score" class="dashlet-box-simple">
			<div class="dashlet-title">Comment Score</div>
			<div><?php echo $this->commentScore ?></div>
		</div>

		<div id="tag-score" class="dashlet-box-simple">
			<div class="dashlet-title">Tag Score</div>
			<div>E: <?php echo $this->exampleConceptCommentScore ?> | Q: <?php echo $this->questionConceptCommentScore ?></div>
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
	        
	    </div>
<?php 
} // end if student
?>	    
		<div id="my-updates" class="dashlet-box">

		</div>

		<div id="my-recent-activity" class="dashlet-box">

		</div>	
	</div><!-- /home-col2 -->
	
	<div id="home-col3" style="float:left;width:40%;">
		<div id="recent-class-activity" class="dashlet-box">


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
