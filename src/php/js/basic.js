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

function showAnswer()
{
	alert("Show Answer for the Question");
}

function postReply(postid)
{
	  var a = document.getElementById("postId");
	  a.value=postid;
	  
	  var c = document.getElementById("parentType");
	  c.value="post";

	  var b = document.getElementById("reply-container");
	  b.style.display='inline';
}

function postNewThread()
{
	  var a = document.getElementById("postId");
	  a.value="";

	  var c = document.getElementById("parentType");
	  c.value="elo";

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