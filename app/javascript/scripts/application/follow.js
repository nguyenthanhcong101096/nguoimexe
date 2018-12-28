import axios from 'axios';
import { delegate } from 'rails-ujs'

export const clickFollow = () => {
  delegate(document, '.js-follow-user', 'click', (event) => {
    const btn = document.querySelector('.js-follow-user')
    const type = btn.getAttribute('type')

    const userId = btn.getAttribute('user-id')
    if (type === 'follow') {
      axios.post('/follows', { user_id: userId })
        .then(response => {
          btn.setAttribute('type', 'unfollow')
          document.querySelector('.js-text-follow').innerHTML = 'Bỏ theo dõi'

        }).catch(error => { throw error })
    }else{
      axios.delete(`/follows/${userId}`)
      .then(response => {
        btn.setAttribute('type', 'follow')
        document.querySelector('.js-text-follow').innerHTML = 'Theo dõi'

      }).catch(error => { throw error })      
    }
  })
}
