# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#remittance_method_pay").on 'change keyup', ->
    console.log $(@).val()
    if $(@).val() is "transferencia"
      $("#banks_details").show()
      $("#retiro_details").hide()
      $("#entrega_details").hide()

    if $(@).val() is "entrega"
      $("#entrega_details").show()
      $("#banks_details").hide()
      $("#retiro_details").hide()

    if $(@).val() is "retiro"
      $("#retiro_details").show()
      $("#banks_details").hide()
      $("#entrega_details").hide()

  $('#remittance_amount_send').bind 'change paste keyup', ->
    console.log $("#rate").val()
    console.log $(@).val()

    if $("#remittance_from").val() is "VEF" and $("#remittance_to").val() is "USD"
      @result = parseFloat($(@).val()) / parseFloat($("#rate_vef").val())
      $('#remittance_amount_receive').val(@result.toFixed(2))

    if $("#remittance_from").val() is "VEF" and $("#remittance_to").val() is "ARS"
      @result = parseFloat($(@).val()) / parseFloat($("#rate_vef").val())
      @result =  @result * parseFloat($("#rate_ars").val())
      $('#remittance_amount_receive').val(@result.toFixed(2))

    if $("#remittance_from").val() is "VEF" and $("#remittance_to").val() is "VEF"
      @result = parseFloat($(@).val())
      $('#remittance_amount_receive').val(@result.toFixed(2))

    if $("#remittance_from").val() is "ARS" and $("#remittance_to").val() is "USD"
      @result = parseFloat($(@).val()) / parseFloat($("#rate_ars").val())
      $('#remittance_amount_receive').val(@result.toFixed(2))

    if $("#remittance_from").val() is "ARS" and $("#remittance_to").val() is "VEF"
      @result = parseFloat($(@).val()) / parseFloat($("#rate_ars").val())
      @result =  @result * parseFloat($("#rate_vef").val())
      $('#remittance_amount_receive').val(@result.toFixed(2))

    if $("#remittance_from").val() is "ARS" and $("#remittance_to").val() is "ARS"
      @result = parseFloat($(@).val())
      $('#remittance_amount_receive').val(@result.toFixed(2))

    if $("#remittance_from").val() is "USD" and $("#remittance_to").val() is "VEF"
      @result = parseFloat($(@).val()) * parseFloat($("#rate_vef").val())
      $('#remittance_amount_receive').val(@result.toFixed(2))

    if $("#remittance_from").val() is "USD" and $("#remittance_to").val() is "ARS"
      @result = parseFloat($(@).val()) * parseFloat($("#rate_ars").val())
      $('#remittance_amount_receive').val(@result.toFixed(2))

    if $("#remittance_from").val() is "USD" and $("#remittance_to").val() is "USD"
      @result = parseFloat($(@).val())
      $('#remittance_amount_receive').val(@result.toFixed(2))
    return
