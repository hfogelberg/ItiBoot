$(function(){
	$('.tab-header li').click(function(event){
		$('.tab-header li').removeClass('active');
		$(this).addClass('active');
		var selectedContent = event.target.id;
		$('.tab-content').css('display', 'none');
		$('#content #' + selectedContent).toggle();
	});
});