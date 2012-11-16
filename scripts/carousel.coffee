$ ->
  carousel = this
  carousel.selectedItem = 0
  isRunning = false
  timerId = 0
  interval = 5000
  numItems = $(".item").length

  $("#onOff").click ->
    if isRunning == false
      carousel.selectedItem += 1
      carousel.selectedItem = 0  if carousel.selectedItem is numItems
      displayImage(carousel.selectedItem)
      timerId = startCarousel(interval, carousel.selectedItem, numItems)
      isRunning = true
    else
      clearInterval(timerId)
      isRunning = false

  $("#next").click ->
    carousel.selectedItem += 1
    carousel.selectedItem = 0  if carousel.selectedItem is numItems
    displayImage(carousel.selectedItem)

  $("#previous").click ->
    carousel.selectedItem -= 1
    carousel.selectedItem = (numItems - 1) if carousel.selectedItem is 0
    displayImage(carousel.selectedItem)

  $("#pop").click ->
    clearInterval(timerId)
    isRunning = false
    docHeight = document.documentElement.clientHeight
    docWidth = document.documentElement.clientWidth
    item = $(".selected :first-child").clone()
    imageHeight = (docHeight * 0.7) + "px"
    $("#popContent").append item
    item.css({"height": imageHeight, "width": "auto" })
    popHeight = $("#popUp").height
    popWidth = $("#popUp").width
    $("#popBackground").css({ "opacity": "0.7", "display": "block"})
    $("#popBackground").fadeIn("slow")
    $("#popUp").css( {"display": "block", "height": "auto", "width": "auto", "top": docHeight-popHeight/2, "left": docWidth/2-popWidth/2})
    $("#popUp").fadeIn("slow")

  $("#popClose").click ->
    $("#popContent").empty()
    $("#popBackground").css({"display": "none"})
    $("#popUp").css({"display": "none"})
    
  startCarousel = (interval, selectedItem, numItems) ->
    return setInterval (->
      selectedItem += 1
      selectedItem = 0  if selectedItem is numItems
      carousel.selectedItem = selectedItem
      displayImage(selectedItem)
    ), interval

  displayImage = (selectedItem) ->
    $(".selected").removeClass "selected"
    $("#carousel .item:eq(" + selectedItem + ")").addClass "selected"
