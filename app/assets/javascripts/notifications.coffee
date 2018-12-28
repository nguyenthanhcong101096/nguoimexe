App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  received: (data) ->
    notifications = $('#notifications');
    counter = $('#notification-counter');
    
    counter_notification  = parseInt(counter.text());
    counter.text(counter_notification + 1);
    notifications.append data['html'];
      
