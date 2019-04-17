export const loadMoreMessage = () => {
  var $messages_body = $('.conversation-messages')
  
  $messages_body.scrollTop($messages_body[0].scrollHeight);
  $messages_body.on('scroll', function () {
    let div = $(this).get(0);
    if (div.scrollTop === 0) {
      console.log('...')
    }
  });
}
