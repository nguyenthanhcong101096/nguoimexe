App.notifications = App.cable.subscriptions.create "StreamMessageChannel",
  received: (data) ->
    message_channel = $('.js-create-message').attr('conversation-id')
    message_new  = $('#messages-latest')
    message_last = $('#js-last-message')
    if(message_channel == "#{data['message_channel']}")
      message_new.before data['html']
      message_last.text(data['last_message'])
      
    