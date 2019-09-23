$(document).ready(function() {

   $("#titlecard").keyup(function(e) {
	   var x = e.keyCode;                // Get the Unicode value
	   var y = String.fromCharCode(x);
	   
	   $("#card-title0").text('')
	   $("#card-title0").append($("#titlecard").val());
   });


});