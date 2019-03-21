import axios from 'axios';
import { delegate } from 'rails-ujs'

export const clickBtnLogin = () => {
  delegate(document, '.js-btn-login', 'click', (event) => {
    let email = document.querySelector('#email').value
    let password = document.querySelector('#password').value

    axios.post('/api/v1/user_sessions', { email: email, password: password })
      .then(response => {
        if (response.data.status === 'ok') {
          window.location = window.location.href
        } else {
          document.querySelector('.js-text-error').innerHTML = "Tài khoản hoặc mật khẩu không đúng"
        }
      }).catch(error => { throw error })
  })
}
