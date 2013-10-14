# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $(document).on 'click', '.cancel_consult_link', ->
    $(".modal-mask").css("display", "block");
    $(".modal-popup").css("display", "block");
    $(".selecting").focus();
    $('body').addClass('noscroll');

  $(document).on 'click', '.cancel_popup', ->
    $(".modal-mask").css("display", "none");
    $(".modal-popup").css("display", "none");
    $(".modal-mask").addClass('modal-mask');
    $(".modal-popup").addClass('modal-popup'); 
    $('body').removeClass('noscroll');

  $(document).on 'change', 'select', '.cancel_consult_confirm', ->
    reason = $("#cancel_consult_combo").find('option:selected').text();
    href = $("#cancel_consult_confirm").attr("href").replace(":id",window.myValue).replace(":canceled_reason",reason);
    $("#cancel_consult_confirm").attr("href",href);

$(document).ready(ready)
$(document).on('page:load', ready)
    
