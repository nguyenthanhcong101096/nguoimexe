App.messages = App.cable.subscriptions.create "MessagesChannel",
  received: (data) ->
    $dot          = $('.btn-massages')
    $msg_not_read = $(".msg-counter")
    $new_message  = $('.js-new-message')
    $room_chat    = $(".js-room-chat-#{data['room_chat']}")
    
    user_id       = $dot.attr('user_id')
    room_chat     = $room_chat.attr('room-chat')
    
    if(data['type'] == 'read')
      $dot.removeClass('badge')
    if user_id == data['target_user']
      $dot.addClass('badge')
      if room_chat == data['room_chat']
        $room_chat.remove()
      $new_message.after data['html']
      $msg_not_read.text("Tin nhắn (#{data['counter']})")
    
  click_message_dropdown: ->
    @perform 'click_message_dropdown'
            
  $(document).on 'click', '.btn-massages', (event) ->
    App.messages.click_message_dropdown()
