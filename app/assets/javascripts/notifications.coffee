App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  received: (data) ->
    show_notification = $('#notifications');
    dot = $('.btn-notification')
    
    if(data['type'] == 'read')
      dot.removeClass('badge')
      counter.text(0);
    else
      dot.addClass('badge')
      show_notification.after data['html'];
    
  read_notifications: ->
    @perform 'read_notifications'
            
  $(document).on 'click', '.btn-notification', (event) ->
    App.notifications.read_notifications()

    
