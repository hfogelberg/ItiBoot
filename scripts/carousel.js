var selectedItem = 0;

setInterval(function(){
	var numItems = $('.item').length;
	if (numItems > 0){
		$(".selected").removeClass("selected");
		selectedItem += 1;
		if (selectedItem == numItems){
			selectedItem = 0;
		}
		$("#carousel .item:eq(" + selectedItem + ")").addClass("selected");
	}
},7000);