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

  $("#pop").click ->
    alert "Pop"

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
