App.messages = App.cable.subscriptions.create "MessagesChannel",
  received: (data) ->
    $dot    = $('.btn-massages')
    user_id = $dot.attr('user_id')
    
    if(data['type'] == 'read')
      $dot.removeClass('badge')
    if user_id == data['target_user']
      $dot.addClass('badge')
    
  click_message_dropdown: ->
    @perform 'click_message_dropdown'
            
  $(document).on 'click', '.btn-massages', (event) ->
    App.messages.click_message_dropdown()
