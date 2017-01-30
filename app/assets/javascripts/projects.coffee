$(document).on "turbolinks:load", ->
  $('.form_datetime').datetimepicker({
    format: 'DD/MM/YYYY'  
  })

$(document).on "turbolinks:load", ->
  $('.edit').tooltip({
    title: 'edit' 
    placement: 'left'  
  })

$(document).on "turbolinks:load", ->
  $('.delete').tooltip({
    title: 'delete'   
    placement: 'right'
  })