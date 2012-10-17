$(function(){ 
    // Display dropdown list when link is clicked
    $('.dropdown a').click(function(event){ 
      $("#log2").html("clicked: " + event.target);
      $(event.target).next('ul').slideDown('slow');                        
  });
});​