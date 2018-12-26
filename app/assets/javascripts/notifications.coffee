App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  received: (data) ->
    notifications = $('#notifications')
    notification_user_channel = notifications.attr('notificaton-user-channel')
    if notification_user_channel == "#{data['channel_user']}"
      notifications.append data['html']
