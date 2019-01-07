App.notifications = App.cable.subscriptions.create "StreamMessageChannel",
  received: (data) ->
    message_channel = $('.js-create-message').attr('conversation-id')
    message_new  = $('.messages')
    message_last = $('#js-last-message')
    your_message = message_new.attr('message-of')
    
    if(message_channel == "#{data['message_channel']}")
      message_last.text(data['last_message'])
      if(your_message != "#{data['to_user']}")
        message_new.append data['html']
      $(".messages").scrollTop($(".messages")[0].scrollHeight);
