App.notifications = App.cable.subscriptions.create "StreamCommentChannel",
  received: (data) ->
    $('#comment-latest').after data['html']
