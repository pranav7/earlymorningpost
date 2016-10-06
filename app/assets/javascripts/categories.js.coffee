# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(".like-button").click (e) ->
  newsId = e.target.dataset.newsId

  $.ajax({
    url: "/news/#{newsId}/like",
    type: "PUT",
    contentType: "application/json",
    dataType: "json",
    success: ->
      like_btn = $("#like-#{newsId}")
      like_btn.removeClass("fa-thumbs-o-up")
      like_btn.addClass("fa-thumbs-up")
      console.log "Liked!"
    error: ->
      console.log "Error!"
  })
  return
