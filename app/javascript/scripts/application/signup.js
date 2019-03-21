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

export const clickSignUp = () => {
  delegate(document, '.js-btn-signup', 'click', (event) => {
    let email = document.querySelector('#signup_email').value
    let username = document.querySelector('#signup_username').value
    let password = document.querySelector('#signup_password').value

    axios.post('/api/v1/user_sessions/signup', { username: username, email: email, password: password })
      .then(response => {
        if (response.data.status === 'ok') {
          window.location = window.location.href
        } else {
          console.log(response.data)
          document.querySelector('.js-error-username').innerHTML = response.data.errors.username || ''
          document.querySelector('.js-error-email').innerHTML = response.data.errors.email || ''
          document.querySelector('.js-error-password').innerHTML = response.data.errors.password || ''
        }
      }).catch(error => { throw error })
  })
}
