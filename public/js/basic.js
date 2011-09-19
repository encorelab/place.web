

function loadClassactivity()
{
	//alert("classactivity()");
	  var a = document.getElementById("recent-class-activity");
//	  a.innerHTML = "hola anto loading...";
	  a.innerHTML += '<br/><br/><img src="/images/loader.gif" />';
}


function uploadFile(obj, dname) {
	 //update status 
//	var mystatus=document.getElementById("traceUpload");
//	mystatus.innerHTML+="<br/>uploadFile() ";
	
	uploadDir=obj.value;
	idname=obj.name;
	dirname=dname;
	filename=uploadDir.substr(uploadDir.lastIndexOf('\\')+1);
	uploaderId = 'uploader'+obj.name;
	uploader = obj.name;
	document.getElementById('formName'+obj.name).submit();
	timeInterval=setInterval("traceUpload()", 1500);
	
	//document.getElementById(uploaderId).innerHTML+="<br/><br/><img src='"+includePath+"loading.gif' alt='loading...' />";
	document.getElementById(uploaderId).innerHTML="<div style='text-align:center;'><img src='/images/loader.gif' alt='loading...' /></div>";
	
}

function postCancel()
{
	$("#reply-new-title").html('');
	$("#reply-container").removeClass('div-show');
	$("#reply-container").addClass('div-hide');
}
	
function postReply(postid)
{
	marksCancel();
	$("#reply-new-title").html('Add a Reply');
	$("#reply-container").removeClass('div-hide');
	$("#reply-container").addClass('div-show');
	
	$("#obj_id").val(postid);
	$("#postId").val(postid);
	$("#parentType").val(1);
}

function postNewThread(obj_id, parentType)
{
	marksCancel();
	$("#postId").val("");
	$("#obj_id").val(obj_id);
	$("#parentType").val(parentType);
	$("#reply-container").removeClass('div-hide');
	$("#reply-container").addClass('div-show');
	$("#reply-new-title").html('Add New Thread');
}

function postVote(vote, id, type, userid, prefix)
{
	
	//alert(prefix);
	//set up a loader image
	//$("#loading").html("<img src=\'/images/loader.gif\'>");
	  
	$("#"+prefix+"vote_value").val(vote);
	$("#"+prefix+"obj_id").val(id);
//	$("#"+prefix+"obj_type").val(type); 
	$("#"+prefix+"activity_on_user").val(userid);
	$("#"+prefix+"i2").val(id);
	//$("#"+prefix+"-form").submit();

	var jqxhr = $.post($("#"+prefix+"vote_form").attr('action'), $("#"+prefix+"vote_form").serialize())
	    .success(function(data) { 
			// test this
			//$("#test-data").html(data);
		 	//alert(data);
		 	if(data==1)
		 		{
		 			alert("You have already voted");
		 		} else if (data == "invalid"){
		 			alert("Invalid parameters")
		 		} else {
		 			var obj = jQuery.parseJSON(data);

		 			// update voting  
		 			  $("#"+prefix+"vote-minus-"+obj.voteOnId).html(obj.votesMinus);
		 			  $("#"+prefix+"vote-total-"+obj.voteOnId).html(obj.votesSumm);
		 			  $("#"+prefix+"vote-plus-"+obj.voteOnId).html(obj.votesPlus);
		 		}})
	    //.error(function() { alert("error"); })
	    //.complete(function() { alert("complete");});
}

function addTag(id)
{
	$("#concept_id").val(id);
	$("#qe_tag_form").submit();
	
}

function showAssessmentReview()
{
	postCancel();
	$('#assessment-review-container').addClass('div-show');
	$('#assessment-review-container').removeClass('div-hide');
	$('#btn_submit_marks').addClass('div-hide');
	$('#btn_submit_marks').removeClass('div-show');
}

function marksCancel()
{
	$('#assessment-review-container').addClass('div-hide');
	$('#assessment-review-container').removeClass('div-show');
	
	$('#btn_submit_marks').addClass('div-show');
	$('#btn_submit_marks').removeClass('div-hide');
}

function marksPost()
{
	alert("post Marks");
	$("#assessment-form").submit();
}
