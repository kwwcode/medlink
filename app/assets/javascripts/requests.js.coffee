# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(->

  window.search = (event)->
    console.log 'hi'
    event.preventDefault()

    data =
      type: $('select[name=type]').val()
      value: $('input[name=search]').val()

    console.log(data)
    $.get('/patients/', data, 'html')
      .done((response)->
        $('#patient-results').html(response))

  $('#search').on('submit', search)
)
