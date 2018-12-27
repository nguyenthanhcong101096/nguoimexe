App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  received: (data) ->
    notifications = $('#notifications');
    counter = $('#notification-counter');
    
    notification_user_channel = notifications.attr('notificaton-user-channel');
    counter_notification  = parseInt(counter.text());
    if notification_user_channel == "#{data['channel_user']}"
      counter.text(counter_notification + 1);
      notifications.append data['html'];
      
