function toggleChecked(status) {
	$(".tag-checkbox").each( function() {
		$(this).attr("checked",status);
	})
}

function toggleChecked(status) {
	$(".tag-checkbox").each( function() {
		$(this).attr("checked",status);
	})
}

function closeConceptList()
{
	//$('#concept-select-list').hide(1000);
	$("#concept-select-list").addClass('div-hide');
	$('#concept-select-link').html('<a href="#" onClick="showConceptList()"><img src="/images/icon_list_arrow_rigth.png" alt="Show Concepts"/></a>');

}

function showConceptList()
{
	//$('#concept-select-list').show(700);
	$("#concept-select-list").removeClass('div-hide');
	$('#concept-select-link').html('<a href="#" onClick="closeConceptList()"><img src="/images/icon_list_arrow_down.png" alt="Show Concepts"/></a>');
	
}

function loadWeb()
{
	/*
	$('#web-container-home').show(700);
	$("#web-container-mask").removeClass('div-hide');
	//$("#web-container-mask").html("<img src='/images/loader.gif' alt='Loading Icon' />");
	$('#webiframe').attr("src","/web");
	$("#web-container-home").removeClass('div-hide');
	*/
	if(popupweb !== undefined && !popupweb.closed)
	{
		popupweb.focus();
	} else {
		var popupweb = window.open('/web','WebPopUp','width=1100,height=800');
	}
	return false;
}

function webLinkToContent(url) 
{
	window.blur();
	window.opener.focus();
	window.opener.location.href = url;
    //window.opener.focus();
	//window.opener.document.focus() ;
	//window.opener.focusAndGo(url);
}

function focusAndGo(url) {
	   window.focus();
	   window.location.href=url;
}

function closeWeb()
{
	$('#web-container-home').hide(1000);
	$('#webiframe').attr("src","");
	$("#web-container-mask").html("");
	$("#web-container-mask").addClass('div-hide');
	//$("#web-container-home").addClass('div-hide');
}

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

function checkReply() {

        var thisContent = tinyMCE.get('replyText').getContent();

        if (thisContent.length < (5+7))
        {
                $( "#error-dialog" ).dialog( "open" );
                $( "#error-dialogue-text").html("<p>You must add to something (at least 5 characters) for your thread entry.</p>");
                return false;
        }


        $("#add-reply").submit();
}
	
function postReply(postid, author_id)
{
	marksCancel();
	$("#reply-new-title").html('Add a Reply');
	$("#reply-container").removeClass('div-hide');
	$("#reply-container").addClass('div-show');

	$("#orig-reply-container").removeClass('div-hide').addClass('div-show');
	
	$("#activity_on_user").val(author_id);
	$("#obj_id").val(postid);
	$("#postId").val(postid);
	$("#parentType").val(1);
	
	var originalReplyMsg = $("#comment" + postid).find("div.post-content").html();
	var x = $("#reply-original-msg").offset().top - 50;
	$("#reply-original-msg").hide().html(originalReplyMsg);
	$('html, body').animate({
    		scrollTop: x 
		},{
		duration: 'slow',
    		complete: function() {
      			$("#reply-original-msg").fadeIn('slow');
    		}
		});
}

function postNewThread(obj_id, parentType, author_id)
{
	marksCancel();
	$("#orig-reply-container").removeClass('div-show').addClass('div-hide');
	$("#activity_on_user").val(author_id);

	$("#postId").val("");
	$("#obj_id").val(obj_id);
	$("#parentType").val(parentType);

	$("#reply-container").removeClass('div-hide');
	$("#reply-container").addClass('div-show');
	$("#reply-new-title").html('Add New Thread');
	var x = $("#reply-container").offset().top - 50;
	$('html, body').animate({
                scrollTop: x
                },{
                duration: 'slow',
                complete: function() {
                
                }
                });

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
//	$("#"+prefix+"vote_form").submit();

	///*
	var jqxhr = $.post($("#"+prefix+"vote_form").attr('action'), $("#"+prefix+"vote_form").serialize())
	    .success(function(data) { 
			// test this
			//$("#test-data").html(data);
		 	//alert(data);
		 	if(data==1)
		 	{
		 		alert("You are not allowed to vote UP");
	 		} else if (data==-1) {
	 			alert("You are not allowed to vote DOWN");
	 		} else {
	 			var obj = jQuery.parseJSON(data);

	 			// update voting  
	 			  $("#"+prefix+"vote-minus-"+obj.voteOnId).html(obj.votesMinus);
	 			  $("#"+prefix+"vote-total-"+obj.voteOnId).html(obj.votesSumm);
	 			  $("#"+prefix+"vote-plus-"+obj.voteOnId).html(obj.votesPlus);
		 		}})
	    //.error(function() { alert("error"); })
	    //.complete(function() { alert("complete");});
	 //*/
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
	//alert("post Marks");
	//$("#assessment-form").submit();
}

function saveAnswer() {
	var thisContent = tinyMCE.get('content').getContent();

        if (thisContent.length < (5+7))
        {
                $( "#error-dialog" ).dialog( "open" );
                $( "#error-dialogue-text").html("<p>You must add to something (at least 5 characters) to the <strong>My Answer</strong> field.</p>");
                return false;
        }

	$("#saveAnswerForm").submit();	
}

function disableEnterKey(e)
{
     var key;     
     if(window.event)
          key = window.event.keyCode; //IE
     else
          key = e.which; //firefox     

     return (key != 13);
}

function validateNewPassword() {

	var passwMatch = false;
	
	if ($("#current-passw").val() == "")
	{
		$("#error-dialog" ).dialog( "open" );
                $("#error-dialogue-text").html("<p>You must provide your current password.</p>");
                //$("#current-passw-alert").html("<p>input your password</p>");
                //$("#current-passw").focus();
                return false;
	} else if ($("#new-passw1").val() == "")	{
		$( "#error-dialog" ).dialog( "open" );
		$("#error-dialogue-text").html("<p>Your new password can not be empty.</p>");
		return false;
	} else if ($("#new-passw1").val().length < (5))	{
		$( "#error-dialog" ).dialog( "open" );
		$( "#error-dialogue-text").html("<p>Your new password must have at least 5 characters.</p>");
		return false;
	} else if ($("#new-passw1").val() != $("#new-passw2").val()) {
		$("#error-dialog").dialog( "open" );
		$("#error-dialogue-text").html("<p>Your new passsword doesn't match.</p>");
        return false;
	} else if ($("#new-passw1").val() == $("#new-passw2").val()) {
		$("#validate").val('1');
		$("#my-preferences").submit();
	}
	
}

function cancelPreferences() {
	location="/myhome";
}

function logout() {
	location="/user/logout";
}