$(function(){ 
	// Display dropdown list when link is clicked
  $('.dropdown a').click(function(){
    $('.dropdown ul').toggle();
  });

  // When hovering over another link in the menu hide any drop down list that is vissible
  $('nav a:not(.dropdown a)').hover(function(){
  	 if($('.dropdown ul').is(':visible')) {
      $('.dropdown ul').hide();
    }
  });
});