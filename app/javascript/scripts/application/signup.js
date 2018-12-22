export default class Signup {
  constructor() {
    this.popup = document.querySelector('.login')
    this.flag = this.popup.getAttribute('data')
    this.btnPopup = document.querySelector('.js-button-login')
    this.formLogin = document.querySelector('.js-form-login')
    this.formRegister = document.querySelector('.js-form-register')
    this.btnRegister = document.querySelector('.js-btn-register')
    this.btnClose = document.querySelectorAll('.btn-close')
    this.btnBack = document.querySelector('.js-btn-back')
    this.btnSubmitPhone = document.querySelector('.btn-verify-phone')
    this.formPhone = document.querySelector('.js-form-phone')
    this.formVerify = document.querySelector('.js-form-verify')
    this.formCreateUser = document.querySelector('.js-form-create-user')
    this.btnSubmitCode = document.querySelector('.btn-verify-code')
  }

  init() {
    if (this.flag == 'true') return
    this.clickLoginPopup()
    this.clickRegisterPopup()
    this.clickClosePopup()
    this.clickBackToLogin()
    this.clickVerifyPhone()
    this.clickVerifyCode()
  }

  clickLoginPopup = () => {
    this.btnPopup.addEventListener('click', () => {
      this.popup.classList.remove('hidden')

      setTimeout(() => {
        this.popup.classList.add('animation')
      }, 200)
    })
  }

  clickRegisterPopup = () => {
    if (!this.btnRegister) return

    this.btnRegister.addEventListener('click', () => {
      this.formLogin.classList.add('hidden')
      this.formRegister.classList.remove('hidden')
    })
  }

  clickClosePopup = () => {
    this.btnClose.forEach(btn => {
      btn.addEventListener('click', () => {
        this.popup.classList.add('hidden')
      })
    })
  }

  clickBackToLogin = () => {
    this.btnBack.addEventListener('click', () => {
      this.formLogin.classList.remove('hidden')
      this.formRegister.classList.add('hidden')
    })
  }

  clickVerifyPhone = () => {
    this.btnSubmitPhone.addEventListener('click',()=>{
      this.formPhone.classList.add('hidden')
      this.formVerify.classList.remove('hidden')
    })
  }
  
  clickVerifyCode = () => {
    this.btnSubmitCode.addEventListener('click',()=>{
      this.formVerify.classList.add('hidden')
      this.formCreateUser.classList.remove('hidden')
    })
  }
}
