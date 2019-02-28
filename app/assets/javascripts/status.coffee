App.status = App.cable.subscriptions.create "StatusChannel",
  received: (data) ->
    active = $('.active')
    myself = active.attr('user_id')
    klass  = $("#" + data['user_id'])
    
    if(data['key'] == 'online')
      if(myself != (data['user_id']))
        active.append(data['html'])
    else
      klass.remove()
