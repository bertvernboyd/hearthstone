# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#page_index").data("page_index", 1)


  $(".col_center").height($(window).height()-$(".header").height())
  $(".col_left").height($(".col_center").height())
  $(".col_right").height($(".col_center").height())
  $(".col_right").width($(".col_left").width())
  window.addEventListener "resize", (e) =>
    $(".col_center").height($(window).height()-$(".header").height())
    $(".col_left").height($(".col_center").height())
    $(".col_right").height($(".col_center").height())
    $(".col_right").width($(".col_left").width())

  $("#submit").click()
 
  $("#search").keyup ->
    $("#submit").click()
    $("#page_index").data("page_index", 1)
    $("#page_index").val($("#page_index").data("page_index"))
