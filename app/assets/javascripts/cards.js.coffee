# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.col_left').on 'click', ->
    $('#page_index').data 'page_index', $('#page_index').data('page_index') - 1
    $('#page_index').val $('#page_index').data('page_index')
    $('#submit').click()
  $('.col_right').on 'click', ->
    $('#page_index').data 'page_index', $('#page_index').data('page_index') + 1
    $('#page_index').val $('#page_index').data('page_index')
    $('#submit').click()

  $("#page_index").data("page_index", 0)

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
    $("#page_index").data("page_index", 0)
    $("#page_index").val($("#page_index").data("page_index")) 
