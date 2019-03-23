App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  received: (data) ->
    dot = $('.btn-notification')
    $new_notification = $('.js-new-notification')
    $counter = $('.js-counter')
    
    if(data['type'] == 'read')
      dot.removeClass('badge')
    else
      dot.addClass('badge')
      $new_notification.append data['html'];
      $counter.text("Thông báo (#{data['counter']})");
    
  read_notifications: ->
    @perform 'read_notifications'
            
  $(document).on 'click', '.btn-notification', (event) ->
    App.notifications.read_notifications()

    
