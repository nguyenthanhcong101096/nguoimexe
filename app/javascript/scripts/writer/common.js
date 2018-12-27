export const onAddPictures = () => {
  const inputFileAvatar = document.querySelector('.js-writer-avatar')
  const pictures = document.querySelector('#pictures-preview')
  const listPictures = document.querySelector('.list-pictures')


  if (!inputFileAvatar) return
  inputFileAvatar.addEventListener('change', (e) => {
    if (inputFileAvatar.files && inputFileAvatar.files[0]) {
      // let reader = new FileReader()
      // const avatar = inputFileAvatar.files[0]

      renderListPicture(inputFileAvatar.files).map(e => {
        listPictures.appendChild(e)
      })

      // reader.onload = (e) => {

      //   pictures.setAttribute('src', e.target.result)
      // }

      // reader.readAsDataURL(avatar)
    }
  })
}

const renderListPicture = (imageFiles) => {
  var items = []
  Array.from(imageFiles).map((item, index) => {
    if(index > 5) return 
    
    let reader = new FileReader()
    var node = document.createElement("img")
    reader.readAsDataURL(item)
    
    reader.onload = (e) => {
      node.setAttribute('src', e.target.result)
    }

    items.push(node)
  })
  return items
}
