App.comments = App.cable.subscriptions.create "LiveCommentChannel",
  received: (data) ->
    comment_channel = $('#render-comments').attr('comment-channel')
    comment_latest  = $('#comment-latest')
    if(comment_channel == "#{data['comment_channel']}")
      comment_latest.after data['html']
      
  create_comment: (message, post_id) ->
    @perform 'create_comment', message: message, post_id: post_id
            
  $(document).on 'keypress', '.js-comment-box', (event) ->
    if event.keyCode is 13
      post_id = $('#btn-create-comment').attr('data-post-id')
      App.comments.create_comment(event.target.value, post_id)
      event.target.value = ""
      event.preventDefault()
