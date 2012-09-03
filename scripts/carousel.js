$(document).ready(function(){
	var numItems = $('.item').length;
	if(numItems > 0){
		$('#carousel .item:eq(0)').addClass('selected');
	}else{
		$('carousel').css('display', 'none');
	}
});

setInterval(function(){
	var numItems = $('.item').length;
	if (numItems > 1){
		$('.selected').toggleClass('selected');
		var randomItem = Math.floor((Math.random()*numItems)+1)-1;		
		$("#carousel .item:eq("+randomItem+")").toggleClass('selected');		
	}
},5000);