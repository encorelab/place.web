var http=createRequestObject();
var uploader="";
var uploadDir="";
var dirname="";
var filename="";
var timeInterval="";
var idname="";
var uploaderId="";

var includePath="include/ajaxfileuploader/";
var contentUrl="_uploadedContent";
//var includePath="";

function changeImg(imgUrl) {
	  var myImg = document.getElementById("eloimg");
	  myImg.setAttribute("src", imgUrl);
	  var myImgName = document.getElementById("uploadedImg");
	  myImgName.value = imgUrl;

}

function createRequestObject() {
    var obj;
    var browser = navigator.appName;
    if(browser == "Microsoft Internet Explorer"){
    	return new ActiveXObject("Microsoft.XMLHTTP");
    }
    else{
    	return new XMLHttpRequest();
    }   
}
function traceUpload() {
   //update status 
	//var mystatus=document.getElementById("traceUpload");
	//mystatus.innerHTML+="<br/>traceUpload has been initialized...";

   http.onreadystatechange = handleResponse;
   http.open("GET", includePath+'imageupload.php?uploadDir='+uploadDir+'&dirname='+dirname+'&filename='+filename+'&uploader='+uploader); 
   http.send(null);   
}
function handleResponse() {
	 //update status 
	//var mystatus=document.getElementById("traceUpload");
	//mystatus.innerHTML+="<br/>handleResponse()";
	
	if(http.readyState == 4){
		var response=http.responseText; 
		if(response.indexOf("File uploaded") != -1){
			clearInterval(timeInterval);
			//document.getElementById('loading'+idname).innerHTML="";
			// replace the image
			//alert(contentUrl+"/"+filename);
			document.getElementById(uploaderId).innerHTML="File Uploaded!<br/> we need to conduct some mine.type detection here<br/> and update the media container accordingly<br/>Here we insert a 'basic ELO'<br/> the only fields needed are: a) a file, b) an ELO name";
			changeImg(contentUrl+"/"+filename);
			
		}
        //document.getElementById(uploaderId).innerHTML=""+response;
		
    }
    else {
    	document.getElementById(uploaderId).innerHTML=" handleResponse() did not work. Check file permissions.";
    }
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
	
	document.getElementById(uploaderId).innerHTML+="<br/><br/><img src='"+includePath+"loading.gif' alt='loading...' />";
}
