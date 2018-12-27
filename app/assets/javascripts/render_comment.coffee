App.notifications = App.cable.subscriptions.create "StreamCommentChannel",
  received: (data) ->
    comment_channel = $('#render-comments').attr('comment-channel')
    comment_latest  = $('#comment-latest')
    if(comment_channel == "#{data['comment_channel']}")
      comment_latest.after data['html']
    