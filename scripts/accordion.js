$(function(){
	$('.accordion li a').click(function(event){
		$('.accordion .accordion-drop ul').slideUp();
		target = event.target;
		$(event.target).next('ul').slideDown('slow'); 
	});
});