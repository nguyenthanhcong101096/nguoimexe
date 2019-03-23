import { closest, addCommonClass, removeActiveClass } from '../lib/utils'

export const clickChangeLanguage = () => {
  const btn = document.querySelector('.js-language-switcher')
  if (!btn) return

  const locale = btn.getAttribute('locale')

  btn.addEventListener('click', () => {
    window.location = locale
  })
}

export const onClickBtnOpenDropdown = () => {
  const btnOpenDropdown = document.querySelectorAll('.js-btn-open-dropdown')
  if (!btnOpenDropdown) return

  Array.prototype.slice.call(btnOpenDropdown).forEach(btn => {
    btn.addEventListener('click', e => {
      e.preventDefault()

      const dataTarget = btn.getAttribute('data-target')
      if (!dataTarget) return
      toggleDropdown(dataTarget)

      return false
    })
  })
}

const toggleDropdown = target => {
  addCommonClass(`.js-dropdown:not([data-dropdown=${target}])`, ['hidden'])
  removeActiveClass(`.js-dropdown:not([data-dropdown=${target}])`, ['has-animation'])

  const dropDownEle = document.querySelector(`.js-dropdown[data-dropdown=${target}]`)
  dropDownEle.classList.toggle('hidden')
  setTimeout(() => { dropDownEle.classList.toggle('has-animation') }, 100)
}

export const onClickBtnCloseAlert = () => {
  const btnCloseAlert = document.querySelectorAll('.js-btn-close-alert')
  if (!btnCloseAlert) return

  Array.prototype.slice.call(btnCloseAlert).forEach(btn => {
    btn.addEventListener('click', () => {
      closest(btn, '.js-alert').classList.add('hidden')
    })
  })
}
