<script>
var servername = "http://<?php echo $_SERVER['SERVER_NAME']; ?>"

$(document).ready(function () {
  $("#my-homework-feed").html("<img src='/images/loader.gif' alt='Loading Icon' />")

  // ajax call for activities
  $("#my-homework-feed").load(servername+"/ajax/myhomework")
  // $("#my-updates-feed").load(servername+"/ajax/myupdates?limit=5", function(){setupAlertCloseButtons('#my-updates-feed')})
  //$("#my-recent-activity-feed").load(servername+"/ajax/myactivity?limit=5", function(){setupAlertCloseButtons('#my-recent-activity-feed')})
  refreshMyUpdates()
  refreshMyActivity()
  refreshClassActivity()
  // $("#recent-class-activity-feed").load(servername+"/ajax/classactivity?limit=5", function(){setupAlertCloseButtons('#recent-class-activity-feed')})

})


function refreshMyUpdates(link){
	return refreshFeed('my-updates-feed', 'myupdates', link)
}

function refreshMyActivity(link){
	return refreshFeed('my-recent-activity-feed', 'myactivity', link)
}

function refreshClassActivity(link){
	return refreshFeed('recent-class-activity-feed', 'classactivity', link);
}

function refreshFeed(feedId, feedUrl, link){
	var from = 0
	var step = 5
	var feed = $('#'+feedId)
	
	if (link != undefined){
		var list = feed.find('.ul-for-data')
		
		from = list.attr('from')
		list.attr('from', from+step)
	}
	
	if (from == 0){
		feed.find("img").remove()
	}
	
	$.get('/ajax/'+feedUrl, {from: from, step: step}, function(data){
		if (data.trim() == ''){
			feed.find('a').remove();
		}
		feed.find(".ul-for-data").append(data)
		setupAlertCloseButtons("#"+feedId)
	})
	
	return false
}

function setupAlertCloseButtons(section){
    console.log('setting up close btn')
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
	$col2Width="50%";
	$col3Width="50%";
	
if($_SESSION['profile']=="STUDENT")
{
	$col2Width="40%";
	$col3Width="40%";
?>
	<div id="home-col1" style="float:left;width:20%;">
		<div class="dashlet-box-simple">
			<div class="dashlet-title">Comment Score</div>
			<div class="comment-score"><?php echo $this->commentScore; ?></div>
		</div>

		<div class="dashlet-box-simple">
			<div class="dashlet-title">Tag Score</div>
			<div class="comment-score"><?php echo $this->tagScore;?></div>
		</div>
	</div><!-- /home-col1 -->
<?php 
} // end if student
?>
	
	<div id="home-col2" style="float:left;width:<?php echo $col2Width;?>;">
<?php 
if($_SESSION['profile']=="STUDENT")
{
?>
<!--
--> 
	    <div id="my-homework" class="dashlet-box">
			<div class="dashlet-title">My Homework</div>
			<div id="my-homework-feed"></div>
	    </div>
 
<?php 
} // end if student
?>	    
		<div id="my-updates" class="dashlet-box">
			<div class="dashlet-title">My Updates</div>
			<div id="my-updates-feed">
				<img src='/images/loader.gif' alt='Loading Icon' />
			    <ul class="ul-for-data" from="6">
				</ul>
				<a style='padding: 10px 180px;' href='#' onclick='return refreshMyUpdates(this);'>more...</a>
			</div>

		</div>

		<div id="my-recent-activity" class="dashlet-box">
			<div class="dashlet-title">My Recent Activity</div>
			<div id="my-recent-activity-feed">
				<img src='/images/loader.gif' alt='Loading Icon' />
			    <ul class="ul-for-data" from="6">
				</ul>
				<a style='padding: 10px 180px;' href='#' onclick='return refreshMyActivity(this);'>more...</a>
			</div>
		</div>	
	</div><!-- /home-col2 -->
	
	<div id="home-col3" style="float:left;width:<?php echo $col3Width;?>;">
		<div id="recent-class-activity" class="dashlet-box">
			<div class="dashlet-title">Recent Class Activity</div>
			<div id="recent-class-activity-feed">
				<img src='/images/loader.gif' alt='Loading Icon' />
			    <ul class="ul-for-data" from="6">
				</ul>
				<a style='padding: 10px 180px;' href='#' onclick='return refreshClassActivity(this);'>more...</a>
			</div>
		</div>	
		<div id="course-actions">
			<div class="dashlet-box"><a href="/example/addform">Create New Example</a></div>
			<?php 
			if($_SESSION['profile']=="TEACHER")
			{
			?>
			<div class="dashlet-box"><a href="/question/addform">Create New Question</a></div>
			<div class="dashlet-box"><a href="/myhome/classlist">Class Management</a></div>
			<div class="dashlet-box"><a href="/myhome/curriculum-journal">Curriculum Journal</a></div>
			<?php } // end if teacher?>
			
			<div class="dashlet-box">
				<a href="#" onClick="loadWeb()">Launch Associative Web</a>
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
			
			<div class="dashlet-box">
				<a href="/Smartroom">Smartroom Activity</a>
			</div>
			

		</div>	
	</div><!-- /home-col3 -->
	
		
</div><!-- /home-columns-->
