$ ->
  # Link the end_at and start_at date fields, for front-end validation
  $('#entry_start_at').datetimepicker
    dayViewHeaderFormat: 'MMMM D'
    sideBySide: true
    stepping: 15
  .on 'dp.change', (e) ->
    $('#entry_end_at').data('DateTimePicker').minDate(e.date) if e.date

  $('#entry_end_at').datetimepicker
    dayViewHeaderFormat: 'MMMM D'
    sideBySide: true
    stepping: 15
  .on 'dp.change', (e) ->
    $('#entry_start_at').data('DateTimePicker').maxDate(e.date) if e.date
