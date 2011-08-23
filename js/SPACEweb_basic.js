var jsonUrl = 'json/data.json';
var eloArray =  new Array();

var debugModeOn = true; // set debug mode 
var errorArray = new Array(); // stores all warning/errors

$.getJSON(jsonUrl,
		function (d) {
			slidesArray = d.data.slides;
		} 
	);

