const dropdown = () => document.querySelector('.js-dropdown')

export const clickChangeLanguage = () => {
  const btn = document.querySelector('.js-language-switcher')
  if (!btn) return

  const locale = btn.getAttribute('locale')

  btn.addEventListener('click', () => {
    window.location = locale
  })
}

export const onClickBtnOpenUserNav = () => {
  const btnOpenUserNav = document.querySelector('.js-btn-open-user-nav')
  if (!btnOpenUserNav) return

  btnOpenUserNav.addEventListener('click', function(e) {
    e.preventDefault()
    dropdown().classList.contains('hidden') ? openUserNav() : closeUserNav()

    return false
  })
}

const openUserNav = () => {
  dropdown().classList.remove('hidden')
  setTimeout(() => { dropdown().classList.add('has-animation') }, 100)
}

const closeUserNav = () => {
  setTimeout(() => { dropdown().classList.remove('has-animation') }, 100)
  dropdown().classList.add('hidden')
}
