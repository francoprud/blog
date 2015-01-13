# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$("#send-last-ten").click ->
  $.ajax
    url: 'articles/send_last_ten'
    success: (data) ->
      console.log("success")
      $('#alert-div').empty();
      mesg = "<div class='alert alert-success alert-dismissible fade in' role='alert'>"
      mesg+= "<button type='button' class='close' data-dismiss='alert' aria-label='Close'>"
      mesg+= "<span aria-hidden='true'>&#x2717;</span>"
      mesg+= "</button>"
      mesg+= "<p class='text-center'>Your request is being processed</p>"
      mesg+= "</div>"
      $('#alert-div').append(mesg)
    error: (data) ->
      console.log("fail")


