// Generated by CoffeeScript 1.3.3
(function() {
  var displayImage, startCarousel;

  $(function() {
    var carousel, interval, isRunning, numItems, timerId;
    carousel = this;
    carousel.selectedItem = 0;
    isRunning = false;
    timerId = 0;
    interval = 5000;
    numItems = $(".item").length;
    $("#pause").click(function() {
      if (isRunning === false) {
        carousel.selectedItem += 1;
        displayImage(carousel.selectedItem);
        timerId = startCarousel(interval, carousel.selectedItem, numItems);
        return isRunning = true;
      } else {
        clearInterval(timerId);
        return isRunning = false;
      }
    });
    $("#next").click(function() {
      carousel.selectedItem += 1;
      return displayImage(carousel.selectedItem);
    });
    return $("#pop").click(function() {
      return alert("Pop");
    });
  });

  startCarousel = function(interval, selectedItem, numItems) {
    return setInterval((function() {
      selectedItem += 1;
      if (selectedItem === numItems) {
        selectedItem = 0;
      }
      carousel.selectedItem = selectedItem;
      return displayImage(selectedItem);
    }), interval);
  };

  displayImage = function(selectedItem) {
    $(".selected").removeClass("selected");
    return $("#carousel .item:eq(" + selectedItem + ")").addClass("selected");
  };

}).call(this);
