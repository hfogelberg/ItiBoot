$ ->
  carousel = this
  carousel.selectedItem = 0
  carousel.popItem = 0
  isRunning = false
  timerId = 0
  interval = 5000
  numItems = $(".item").length

  $(".tools #onOff").click ->
    if isRunning == false
      carousel.selectedItem += 1
      carousel.selectedItem = 0  if carousel.selectedItem is numItems
      displayImage(carousel.selectedItem)
      timerId = startCarousel(interval, carousel.selectedItem, numItems)
      isRunning = true
    else
      clearInterval(timerId)
      isRunning = false

  $(".tools #next").click ->
    carousel.selectedItem += 1
    carousel.selectedItem = 0  if carousel.selectedItem is numItems
    displayImage(carousel.selectedItem)

  $("tools #previous").click ->
    carousel.selectedItem -= 1
    carousel.selectedItem = (numItems - 1) if carousel.selectedItem is 0
    displayImage(carousel.selectedItem)

  $(".tools #pop").click ->
    clearInterval(timerId)
    isRunning = false
    carousel.popItem = carousel.selectedItem
    $(".selected").addClass 'popImage'
    displayPopImage()

  $(".popTools #next").click ->
    carousel.popItem += 1
    carousel.popItem= 0  if carousel.popItem is numItems
    displayPopImage()

  $(".popTools #previous").click ->
    carousel.popItem -= 1
    carousel.popItem= (numItems - 1) if carousel.popItem is 0
    displayPopImage()

  $(".popTools #onOff").click ->
    if isRunning == false
      carousel.popItem += 1
      carousel.popItem = 0  if carousel.popItem is numItems
      timerId = startPopCarousel(interval, numItems)
      isRunning = true
    else
      clearInterval(timerId)
      isRunning = false

  $("#popClose").click ->
    clearInterval(timerId)
    isRunning = false
    $("#popContent").empty()
    $("#popBackground").css({"display": "none"})
    $("#popUp").css({"display": "none"})
    carousel.selectedItem = carousel.popItem
    displayImage(carousel.selectedItem)
    
  startCarousel = (interval, selectedItem, numItems) ->
    return setInterval (->
      selectedItem += 1
      selectedItem = 0  if selectedItem is numItems
      carousel.selectedItem = selectedItem
      displayImage(selectedItem)
    ), interval

  startPopCarousel = (interval, numItems) ->
    return setInterval (->
      carousel.popItem += 1
      carousel.popItem= 0  if carousel.popItem is numItems
      displayPopImage()
    ), interval

  displayImage = (selectedItem) ->
    $(".selected").removeClass "selected"
    $("#carousel .item:eq(" + selectedItem + ")").addClass "selected"

  displayPopImage = () ->
    $('#carousel .item').removeClass 'popImage'
    $("#carousel .item:eq(" + carousel.popItem+ ")").addClass 'popImage'
    $("#popContent").empty()
    docHeight = document.documentElement.clientHeight
    docWidth = document.documentElement.clientWidth
    imageHeight = (docHeight * 0.7) + "px"
    item = $(".popImage :first-child").clone()
    item.css({"height": imageHeight, "width": "auto" })
    popHeight = $("#popUp").height
    popWidth = $("#popUp").width
    $("#popContent").append item
    $("#popBackground").css({ "opacity": "0.7", "display": "block"})
    $("#popBackground").fadeIn("slow")
    $("#popUp").css( {"display": "block", "height": "auto", "width": "auto", "top": 10, "left": 10})
    $("#popUp").fadeIn("slow")
