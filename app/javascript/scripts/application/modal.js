import { removeActiveClass, getSiblings } from '../lib/utils'

const modalWrapper = () => document.querySelector('.js-modal-wrapper')

export const onChangeTabModal = () => {
  const btnModalTab = document.querySelectorAll('.js-btn-modal-tab')
  Array.prototype.slice.call(btnModalTab).forEach(btn => {
    btn.addEventListener('click', function(e) {
      e.preventDefault()
      removeActiveClass('.js-btn-modal-tab', 'is-active')
      e.target.classList.add('is-active')

      const dataModalTarget = e.target.getAttribute('data-target')
      if (!dataModalTarget) return

      activeModalTab(dataModalTarget)
      return false
    })
  })
}

export const onClickBtnCloseModal = () => {
  document.querySelector('.js-btn-close-modal').addEventListener('click', function() {
    closeModal()
  })
}

export const onClickBtnOpenModal = () => {
  const btnOpenModal = document.querySelectorAll('.js-btn-open-login-modal')
  Array.prototype.slice.call(btnOpenModal).forEach(btn => {
    btn.addEventListener('click', function(e) {
      e.preventDefault()
      const dataTarget = e.target.getAttribute('data-target')
      if (!dataTarget) return

      openModal()
      document.querySelector(`.js-btn-modal-tab[data-target=${dataTarget}]`).click()

      return false
    })
  })
}

const activeModalTab = dataTarget => {
  const target = document.querySelector(`#${dataTarget}`)
  target.classList.remove('hidden')

  getSiblings(target).forEach(element => {
    element.classList.add('hidden')
  })
}

const closeModal = () => {
  modalWrapper().classList.remove('has-animation')
  setTimeout(() => { modalWrapper().classList.add('hidden') }, 100)
}

const openModal = () => {
  modalWrapper().classList.remove('hidden')
  setTimeout(() => { modalWrapper().classList.add('has-animation') }, 100)
}
