jQuery ->
  held_positions = $('#form_held_position_id').html()
  $("#form_dependency_id").change ->
    dependecy = $('#form_dependency_id :selected').text()
    options = $(held_positions).filter("optgroup[label='#{dependecy}']").html()
    if options
      $('#form_held_position_id').html(options)
    else
      $('#form_held_position_id').empty()
