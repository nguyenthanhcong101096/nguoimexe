import axios from 'axios';

export const enterCreateMesssage = () => {
  const msgBox = document.querySelector('.js-box-message')

  if (!msgBox) return

  // msgBox.addEventListener("keydown", (event) => {
  //   if (event.which === 13 ) {
  //     event.preventDefault();

  //     const conversationId = msgBox.getAttribute('conversation-id')
  //     const msg = msgBox.value

  //     axios.post('/messages', { conversation_id: conversationId, msg: msg })
  //       .then(response => {
  //         msgBox.value = ''
  //         return response
  //       })
  //       .catch(error => {
  //         console.log(error)
  //       })
  //   }
  // });
  
  const btn = document.querySelector('.js-create-message')
  btn.addEventListener('click', () => {
    const conversationId = msgBox.getAttribute('conversation-id')
    const msg = msgBox.value

    axios.post('/messages', { conversation_id: conversationId, msg: msg })
      .then(response => {
        msgBox.value = 'x'
        return response
      })
      .catch(error => {
        console.log(error)
      })
  })
}

