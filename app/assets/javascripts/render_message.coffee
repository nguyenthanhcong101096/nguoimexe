App.chat = App.cable.subscriptions.create "StreamMessageChannel",
  received: (data) ->
    $message_new  = $('.new-messages')
    $message_last = $('#js-last-message')
    
    $message_last.text(data['last_message'])
    
    if $message_new.attr('user_id') == data['user_id']
      $message_new.append data['right_html']
    else
      $message_new.append data['left_html']
    $(".new-messages").scrollTop($(".new-messages")[0].scrollHeight);
  
  send_message: (conversation_id, msg, img) ->
    @perform 'send_message', conversation_id: conversation_id, msg: msg, img: img
            
  $(document).on 'keypress', '.js-create-message', (event) ->
    conversation_id = $('.js-create-message').attr('conversation-id')
    msg = event.target.innerText
    
    if event.keyCode is 13
      App.chat.send_message(conversation_id, msg)
      event.target.innerText = ""
      event.preventDefault()
      
  $(document).on 'change', '#picture', (event) ->
    $files = $('#picture')
    image  = $files[0].files[0] if ($files[0].files && $files[0].files[0])
    conversation_id = $('.js-create-message').attr('conversation-id')
    
    return unless image?
    
    if image
      reader = new FileReader()
      reader.onload = (e) => App.chat.send_message(conversation_id, '', e.target.result)
      reader.readAsDataURL(image)
