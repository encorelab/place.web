	/*
var jsonUrl = 'json/data.json';
var eloArray =  new Array();

var debugModeOn = true; // set debug mode 
var errorArray = new Array(); // stores all warning/errors

$.getJSON(jsonUrl,
		function (d) {
			slidesArray = d.data.slides;
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


function postVote(val, id)
{
	alert(""+val+" to POST "+ id);
}

function tagVote(val, id)
{
	alert(""+val+" to TAG "+ id);
}

function addTag(id)
{
	alert("adding Tag "+id+" to this elo");
}


