App.chat = App.cable.subscriptions.create "LiveMessageChannel",
  received: (data) ->
    $message_new   = $('.new-messages')
    $enter_message =$('.enter-message')
    
    if $message_new.attr('user_id') == data['user_id']
      $message_new.append data['right_html']
    else
      if data['size'] > 0
        $enter_message.removeClass('hidden')
      else
        $enter_message.addClass('hidden')
      $message_new.append data['left_html']
  
  send_message: (conversation_id, msg, img) ->
    @perform 'send_message', conversation_id: conversation_id, msg: msg, img: img
            
  enter_message: (size) ->
    @perform 'enter_message', size: size
    
  #send mesage 
  $(document).on 'keypress', '.js-create-message', (event) ->
    conversation_id = $('.js-create-message').attr('conversation-id')
    msg = event.target.innerText
    if event.keyCode is 13
      App.chat.send_message(conversation_id, msg)
      event.target.innerText = ""
      event.preventDefault()
        
  #enter message 
  $(document).on 'keydown', '.js-create-message', (event) ->    
    size = event.target.innerText.length
    App.chat.enter_message(size)
    
  #send imgage
  $(document).on 'change', '#picture', (event) ->
    $files = $('#picture')
    image  = $files[0].files[0] if ($files[0].files && $files[0].files[0])
    conversation_id = $('.js-create-message').attr('conversation-id')
    
    return unless image?
    
    if image
      reader = new FileReader()
      reader.onload = (e) => App.chat.send_message(conversation_id, '', e.target.result)
      reader.readAsDataURL(image)
