App.messages = App.cable.subscriptions.create "MessagesChannel",
  received: (data) ->
    $dot          = $('.btn-massages')
    $msg_not_read = $(".msg-counter")
    $new_message  = $('.js-new-message')
    $room_chat    = $(".js-room-chat-#{data['room_chat']}")
    
    user_id       = parseInt($dot.attr('user_id'))
    room_chat     = $room_chat.attr('room-chat')
    
    if(data['type'] == 'read')
      $dot.removeClass('badge')
      
    if data['room_members'].includes(user_id)
      if room_chat == data['room_chat']
        $room_chat.remove()
      if data['receiver'].includes(user_id)
        $dot.addClass('badge')
        $new_message.after data['receiver_html']
      else
        $new_message.after data['sender_html']
      $msg_not_read.text("Tin nhắn (#{data['counter']})")
    
  click_message_dropdown: ->
    @perform 'click_message_dropdown'
            
  $(document).on 'click', '.btn-massages', (event) ->
    App.messages.click_message_dropdown()
