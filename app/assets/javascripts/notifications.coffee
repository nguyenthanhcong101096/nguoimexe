App.notifications = App.cable.subscriptions.create "NotificationsChannel",
  received: (data) ->
    dot = $('.btn-notification')
    $new_notification = $('.js-new-notification')
    $counter = $('.js-counter')
    
    if(data['type'] == 'read')
      dot.removeClass('badge')
    else
      dot.addClass('badge')
      $new_notification.after data['html'];
      $counter.text("Thông báo (#{data['counter']})");
    
  click_dropdown_notifications: ->
    @perform 'click_dropdown_notifications'
            
  $(document).on 'click', '.btn-notification', (event) ->
    App.notifications.click_dropdown_notifications()

    
