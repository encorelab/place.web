/*
var jsonUrl = 'http://placeweb/ajax/uploadfile';
var mediaArr =  new Array();

$.getJSON(jsonUrl,
		function (d) {
			mediaArr = d.GET;
		} 
	);

*/


function loadInitFunctions()
{

	//alert("DOM loaded");
	//classactivity();
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

function showAnswer()
{
	alert("Show Answer for the Question");
}

function postReply(postid)
{
	//var a = document.getElementById("postId");  
	var a = document.getElementById("obj_id");
	  a.value=postid;

	  var d = document.getElementById("postId");
	  d.value=postid;
	  
	  var c = document.getElementById("parentType");
	  c.value="1";

	  var b = document.getElementById("reply-container");
	  b.style.display='inline';
}

function postNewThread(parentType)
{
	  var a = document.getElementById("postId");
	  a.value="";

	  var c = document.getElementById("parentType");
	  c.value=parentType;

	  var b = document.getElementById("reply-container");
	  b.style.display='inline';

	  var d = document.getElementById("newThread-container");
	  d.style.display='none';
}

function postVote(val, id, type, userid)
{
	//set up a loader image
	//$("#loading").html("<img src=\'/images/loader.gif\'>");
	  
	$("#vote_value").val(val);
	$("#vote_obj_id").val(id);
	$("#vote_obj_type").val(type);
	$("#vote_activity_on_user").val(userid);
	$("#vote_i2").val(id);
	//$("#vote-form").submit();

	 var jqxhr = $.post($("#vote-form").attr('action'), $("#vote-form").serialize())
	    .success(function(data) { 
		 	//alert(data);
		 	if(data==1)
		 		{
		 			alert("You have already voted");
		 		} else if (data == "invalid"){
		 			alert("Invalid parameters")
		 		} else {
		 			var obj = jQuery.parseJSON(data);
		 			// update voting 
		 			  $("#"+obj.voteOnName+"-minus-"+obj.voteOnId).html(obj.votesMinus);
		 			  $("#"+obj.voteOnName+"-total-"+obj.voteOnId).html(obj.votesSumm);
		 			  $("#"+obj.voteOnName+"-plus-"+obj.voteOnId).html(obj.votesPlus);
		 		}
		 		
		 })
	    //.error(function() { alert("error"); })
	    //.complete(function() { alert("complete");});
}

/*

 */
function tagVote(val, id)
{
	alert(""+val+" to TAG "+ id);
}

function addTag(id)
{
	alert("adding Tag "+id+" to this elo");
}


