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
	$("#postId").val("");
	$("#parentType").val(parentType);

	var b = document.getElementById("reply-container");
	b.style.display='inline';

	var d = document.getElementById("newThread-container");
	d.style.display='none';
}

function postVote(vote, id, type, userid, prefix)
{
	
	//alert(prefix);
	//set up a loader image
	//$("#loading").html("<img src=\'/images/loader.gif\'>");
	  
	$("#"+prefix+"vote_value").val(vote);
	$("#"+prefix+"obj_id").val(id);
	$("#"+prefix+"obj_type").val(type);
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
	alert("adding Tag "+id+" to this elo");
}
