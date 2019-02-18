// import axios from 'axios'

// export default class Signup {
//   constructor() {
//     this.paramsSignup = {}

//     this.popup = document.querySelector('.login')
//     this.flag = this.popup.getAttribute('data')
//     this.holdPhone = document.querySelector('.js-hold-phone')

//     this.btnPopup = document.querySelector('.js-button-login')
//     this.btnRegister = document.querySelector('.js-btn-register')
//     this.btnClose = document.querySelectorAll('.btn-close')
//     this.btnBack = document.querySelector('.js-btn-back')
//     this.btnLogin = document.querySelector('.js-btn-login')
//     this.btnForgetPassword = document.querySelector('.js-forget-password')
//     this.btnBackResetToLogin = document.querySelector('.js-btn-back-login')

//     this.formResetPassword = document.querySelector('.js-form-reset-password')
//     this.formPhone = document.querySelector('.js-form-phone')
//     this.formVerify = document.querySelector('.js-form-verify')
//     this.formCreateUser = document.querySelector('.js-form-create-user')
//     this.formRegister = document.querySelector('.js-form-register')
//     this.formLogin = document.querySelector('.js-form-login')
//     this.formInputPhone =  document.querySelector('.form-reset-password')
//     this.formVerifyPhone = document.querySelector('.form-verify-sms-code')
//     this.formChangeViaSMS = document.querySelector('.form-change-password-via-sms')
//   }

//   init() {
//     if (this.flag == 'true') return
//     this.clickLoginPopup()
//     this.clickRegisterPopup()
//     this.clickClosePopup()
//     this.clickBackToLogin()
//     this.onClickBtnNext()
//     this.onClickLogin()
//     this.clickResetPassword()
//     this.clickBackRestToLogin()
//     this.onClickBtnNextReset()
//   }

//   clickLoginPopup = () => {
//     this.btnPopup.addEventListener('click', () => {
//       this.popup.classList.remove('hidden')

//       setTimeout(() => {
//         this.popup.classList.add('animation')
//       }, 200)
//     })
//   }

//   clickResetPassword = () => {
//     this.btnForgetPassword.addEventListener('click', () => {
//       this.formLogin.classList.add('hidden')
//       this.formResetPassword.classList.remove('hidden')
//     })
//   }

//   clickBackRestToLogin = () => {
//     this.btnBackResetToLogin.addEventListener('click', () => {
//       this.formLogin.classList.remove('hidden')
//       this.formResetPassword.classList.add('hidden')
//     })
//   }

//   clickRegisterPopup = () => {
//     if (!this.btnRegister) return

//     this.btnRegister.addEventListener('click', () => {
//       this.formLogin.classList.add('hidden')
//       this.formRegister.classList.remove('hidden')
//     })
//   }

//   clickClosePopup = () => {
//     this.btnClose.forEach(btn => {
//       btn.addEventListener('click', () => {
//         this.popup.classList.add('hidden')
//       })
//     })
//   }

//   clickBackToLogin = () => {
//     this.btnBack.addEventListener('click', () => {
//       this.formLogin.classList.remove('hidden')
//       this.formRegister.classList.add('hidden')
//     })
//   }

//   onClickLogin = () => {
//     this.btnLogin.addEventListener('click', () => {
//       axios.post('/signin', this.paramsAtSession('login'), { headers: { 'Content-Type': 'multipart/form-data' } })
//         .then(response => {
//           if (response.data.status === 'error') {
//             document.querySelector('.js-error-login').innerHTML = response.data.message
//           } else {
//             window.location = '/'
//           }
//         })
//     })
//   }

//   onClickBtnNextReset = () => {
//     const btnNext = document.querySelectorAll('.js-btn-reset-step')
//     btnNext.forEach(btn => {
//       btn.addEventListener('click', () => {
//         const currentStep = btn.getAttribute('data-step')
//         axios.post('/reset_pwd', this.paramsAtSession(currentStep), { headers: { 'Content-Type': 'multipart/form-data' } })
//           .then(response => {
//             console.log(response.data)
//             if(response.data.status === 'error'){
//               document.querySelector('.js-error').innerHTML = response.data.message
//             }else{
//               document.querySelector('.js-error').innerHTML = ''
//               this.displayNextSignupStep(response.data)
//             }
//           })
//       })
//     })
//   }

//   onClickBtnNext = () => {
//     const btnNext = document.querySelectorAll('.js-btn-signup-step')
//     btnNext.forEach(btn => {
//       btn.addEventListener('click', () => {
//         const currentStep = btn.getAttribute('data-step')
//         axios.post('/verify', this.paramsAtSession(currentStep), { headers: { 'Content-Type': 'multipart/form-data' } })
//           .then(response => {
//             if (response.data.status === 'error') {
//               this.displayErrors(response.data.errors)
//             } else {
//               this.displayNextSignupStep(response.data)
//             }
//           })
//       })
//     })
//   }

//   displayNextSignupStep(data) {
//     if (data.step === "2") {
//       this.holdPhone.value = data.phone
//       this.formPhone.classList.add('hidden')
//       this.formVerify.classList.remove('hidden')
//     }
//     if (data.step === "3") {
//       this.formVerify.classList.add('hidden')
//       this.formCreateUser.classList.remove('hidden')
//     }
//     if (data.step === "4")
//       window.location = "http://localhost:3000";
      
//     switch (data.step) {
//       case 'verify-code':
//         this.holdPhone.value = data.phone
//         this.formInputPhone.classList.add('hidden')
//         this.formVerifyPhone.classList.remove('hidden')
//         break;
//       case 'change-password-via-sms':
//         this.formVerifyPhone.classList.add('hidden')
//         this.formChangeViaSMS.classList.remove('hidden')
//         break;
//       case 'done':
//         window.location = "http://localhost:3000";
//         break;
//     }
//   }


//   displayErrors(errors) {
//     Object.keys(errors).forEach(k => { document.querySelector(`.js-error-${k}`).innerHTML = errors[k][0] })
//   }

//   paramsAtSession(step) {
//     let params = {}

//     switch (step) {
//       case '1':
//         params = {
//           phone: document.querySelector('input[name=phone]').value
//         }
//         break;
//       case '2':
//         params = {
//           code: document.querySelector('input[name=code]').value,
//           phone: document.querySelector('input[name=hold-phone]').value
//         }
//         break;
//       case '3':
//         params = {
//           phone: document.querySelector('input[name=hold-phone]').value,
//           address: document.querySelector('input[name=address]').value,
//           username: document.querySelector('input[name=username]').value,
//           password: document.querySelector('input[name=password]').value,
//           password_confirmation: document.querySelector('input[name=password_confirmation]').value
//         }
//         break;
//       case 'login':
//         params = {
//           phone: document.querySelector('input[name=login_phone]').value,
//           password: document.querySelector('input[name=login_password]').value
//         }
//         break;
//       case 'verify-phone':
//         params = { phone: document.querySelector('input[name=reset_phone]').value }
//         break;
//       case 'verify-code':
//         params = { 
//           code: document.querySelector('input[name=reset_code]').value, 
//           phone: document.querySelector('input[name=hold-phone]').value 
//         }
//         break;
//       case 'change-password-via-sms':
//         params = { 
//           phone: document.querySelector('input[name=hold-phone]').value,
//           password: document.querySelector('input[name=reset_password]').value,
//           password_confirmation: document.querySelector('input[name=reset_password_confirmation]').value
//         }
//         break;
//     }

//     Object.assign(this.paramsSignup, params)

//     let formData = new FormData()
//     Object.keys(Object.assign(params, { step: step })).forEach(key => {
//       formData.append(key, params[key])
//     })

//     return formData
//   }
// }
