// SimplePop
// (c) Henrik Fogelberg henrik.fogelberg@gmail.com

function showPop(file){
	$("#background").css({
		"opacity": "0.7",
		"display": "block"});
	$("#background").fadeIn("slow");
	
	var docHeight = document.documentElement.clientHeight;
	var popHeight = $("#popUp").height();
	var docWidth = document.documentElement.clientWidth;
	var popWidth = $("#popUp").width();
	
	$("#popUp").css({
		"display": "block",
		"position": "absolute",
		"top": docHeight/2-popHeight/2,
		"left": docWidth/2-popWidth/2
	});

	$("#popContent").load(file);
	$("#popUp").fadeIn("slow");
}

function hidePop(){
	$("#popUp").css({
		"display": "none"
	});
	$("#background").css({
		"display": "none"
	});
}

$(function(){
	$("#show_pop").click(function(){
		showPop("external.html");
	});	
	
	$("#popClose").click(function(){
		hidePop();
	});
});
