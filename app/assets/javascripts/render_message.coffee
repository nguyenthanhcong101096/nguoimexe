App.chat = App.cable.subscriptions.create({channel: "StreamMessageChannel", room: '1'},
  received: (data) ->
    message_channel = $('.js-create-message').attr('conversation-id')
    message_new  = $('.messages')
    message_last = $('#js-last-message')
    if(message_channel == "#{data['message_channel']}")
      message_last.text(data['last_message'])
      message_new.append data['html']
      $(".messages").scrollTop($(".messages")[0].scrollHeight);
  
  send_message: (conversation_id, msg, img) ->
    @perform 'send_message', conversation_id: conversation_id, msg: msg, img: img
            
  $(document).on 'keypress', '.js-create-message', (event) ->
    conversation_id = $('.js-create-message').attr('conversation-id')
    $files = $('#picture')
    image  = $files[0].files[0] if ($files[0].files && $files[0].files[0])
    msg    = event.target.value 
    
    if event.keyCode is 13
      if (window.File && window.FileReader && window.FileList && window.Blob && image)
        reader = new FileReader()
        reader.onload = (e) => App.chat.send_message(conversation_id, msg, e.target.result)  
        reader.readAsDataURL(image)   
      else
        App.chat.send_message(conversation_id, event.target.value)  
      event.target.value = ""
      event.preventDefault()
      
  $(document).on 'change', '#picture', (event) ->
    $files = $('#picture')
    image = $files[0].files[0] if ($files[0].files && $files[0].files[0])
    return unless image?
    $imagePreview = $('#image')
    if (window.File && window.FileReader && window.FileList && window.Blob)
      reader = new FileReader()
      reader.onload = (e) => $imagePreview.css('background-image', "url(#{e.target.result})").text('')
      reader.readAsDataURL(image)
)

