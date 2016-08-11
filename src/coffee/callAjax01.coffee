define ['jquery'], () ->
  (success,fail) ->
    $.ajax {
      url : '/api/ajax01.json' ,
      type : 'GET',
      success: (data) ->
        $('#result').html("Success:"+ JSON.stringify(data))
        if (success)
          success(data)

      error: (data) ->
        alert('ERROR!' + data)
        if (fail)
          fail(data)
    }

# return callAjax01
