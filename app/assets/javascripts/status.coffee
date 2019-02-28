App.status = App.cable.subscriptions.create "StatusChannel",
  received: (data) ->
    active = $('.active')
    userId = active.attr('user_id')
    
    if(data['key'] == 'online')
      if(userId != (data['user_id']+""))
        active.append(data['html'])
    else
      $("#" + data['user_id']).remove()
