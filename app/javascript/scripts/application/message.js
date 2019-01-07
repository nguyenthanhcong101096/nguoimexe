import axios from 'axios';

export const enterCreateMesssage = () => {
  const msgBox = document.querySelector('.js-create-message')  
  const msgArea = document.querySelector('.messages')
  
  if(!msgBox) return
  
  msgArea.scrollTop = msgArea.scrollHeight;
  msgBox.addEventListener("keydown", (event) => {
    
    if (event.which === 13 ) {
      event.preventDefault();
      
      const conversationId = msgBox.getAttribute('conversation-id')
      const msg = msgBox.value

      axios.post('/messages', { conversation_id: conversationId, msg: msg })
        .then(response => {
          msgBox.value = ''
          msgArea.scrollTop = msgArea.scrollHeight;
          msgArea.insertAdjacentHTML('beforeend', response.data.message)
          return response
        })
        .catch(error => {
          console.log(error)
        })
    }
  });
}

