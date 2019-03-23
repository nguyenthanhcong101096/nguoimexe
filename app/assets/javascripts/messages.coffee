App.messages = App.cable.subscriptions.create "MessagesChannel",
  received: (data) ->
    $dot    = $('.btn-massages')
    user_id = $dot.attr('user_id')
    # $new_notification = $('.js-new-notification')
    # $counter = $('.js-counter')
    
    if(data['type'] == 'read')
      $dot.removeClass('badge')
    if user_id == data['target_user']
      $dot.addClass('badge')
      # $new_notification.after data['html'];
      # $counter.text("Thông báo (#{data['counter']})");
    
  read_messages: ->
    @perform 'read_messages'
            
  $(document).on 'click', '.btn-massages', (event) ->
    App.messages.read_messages()
