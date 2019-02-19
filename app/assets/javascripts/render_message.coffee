App.chat = App.cable.subscriptions.create "StreamMessageChannel",
  received: (data) ->
    message_channel = $('.js-create-message').attr('conversation-id')
    message_new  = $('.messages')
    message_last = $('#js-last-message')
    your_message = message_new.attr('message-of')
    
    if(message_channel == "#{data['message_channel']}")
      message_last.text(data['last_message'])
      # if(your_message != "#{data['to_user']}")
      message_new.append data['html']
      $(".messages").scrollTop($(".messages")[0].scrollHeight);
  
  send_message: (conversation_id, msg) ->
    @perform 'send_message', conversation_id: conversation_id, msg: msg
            
  $(document).on 'keypress', '.js-create-message', (event) ->
    conversation_id = $('.js-create-message').attr('conversation-id')
    if event.keyCode is 13
      App.chat.send_message(conversation_id, event.target.value)
      event.target.value = ""
      event.preventDefault()
