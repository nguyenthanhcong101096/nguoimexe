App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  received: (data) ->
    $('#messages').append data['html']
