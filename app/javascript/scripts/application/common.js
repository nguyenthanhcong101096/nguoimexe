export const clickChangeLanguage = () => {
  const btn = document.querySelector('.js-language-switcher')
  if (!btn) return

  const locale = btn.getAttribute('locale')

  btn.addEventListener('click', () => {
    window.location = locale
  })
}
