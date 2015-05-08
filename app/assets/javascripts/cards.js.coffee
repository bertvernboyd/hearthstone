# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
 
  $("#submit").click()

  $("#search").keyup ->
    $("#submit").click()

#  $("#search").keyup ->
#    regex = new RegExp("\^"+$("#search").val(),'i') 
#    $("tr:has(td#name)").hide()
#    ($("tr:has(td#name)").filter ->
#      $(this).find("td#name").text().match regex).show()
#
#    return
