App.room = App.cable.subscriptions.create "NotificationsChannel",
  received: (data) ->
    $('#messages').append data['notifications']
