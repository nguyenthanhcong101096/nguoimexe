const color = ['#df4a32', '#dd4b39', '#ff9926', '#888', '#3b5998', '#009966', '#CC3300']

export const autoChangeColor = () => {
  const listCard = document.querySelectorAll('.card')
  listCard.forEach(card => {
    var rand = Math.floor(Math.random() * Math.floor(6));
    card.style.borderColor = color[rand];
  })
}
