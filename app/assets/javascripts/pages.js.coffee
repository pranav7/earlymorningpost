# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

container = document.querySelector("#cards-wrapper")
msnry = new Masonry(container,
  
  # options
  #columnWidth: 200,
  gutter: 18,
  itemSelector: ".card"
)