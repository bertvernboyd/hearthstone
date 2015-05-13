# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  $(".col_center").data("page_index", 0)

  $(".col_left").height($(window).height())
  $(".col_center").height($(window).height())
  $(".col_right").height($(window).height())
  $(".col_right").width($(".col_left").width())
  window.addEventListener "resize", (e) =>
    $(".col_left").height($(window).height()-$(".banner").height())
    $(".col_center").height($(window).height())
    $(".col_right").height($(window).height())
    $(".col_right").width($(".col_left").width())

  $("#submit").click()
 
  $("#search").keyup ->
    $("#submit").click()
    $(".col_center").data("page_index", 0)
    

  

#  $("#search").keyup ->
#    regex = new RegExp("\^"+$("#search").val(),'i') 
#    $("tr:has(td#name)").hide()
#    ($("tr:has(td#name)").filter ->
#      $(this).find("td#name").text().match regex).show()
#
#    return
