export const clickLoginPopup = () => {
  const button = document.querySelector('.js-button-login');
  const popup = document.querySelector('.login');
  
  button.addEventListener('click', () => {
    popup.classList.remove('hidden')
    
    setTimeout(()=>{
      popup.classList.add('animation')    
    }, 200)
  })
}

