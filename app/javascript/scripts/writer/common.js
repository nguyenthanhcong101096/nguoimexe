export const onAddPictures = () => {
  const inputFileAvatar = document.querySelector('.js-writer-avatar')
  const pictures = document.querySelector('#pictures-preview')
  const listPictures = document.querySelector('.list-pictures')

  if (!inputFileAvatar) return
  inputFileAvatar.addEventListener('change', (e) => {
    if (inputFileAvatar.files && inputFileAvatar.files[0]) {
      let reader = new FileReader()
      const avatar = inputFileAvatar.files[0]
      console.log(inputFileAvatar.files)
      
      reader.onload = (e) => {
        this.avatarDataUri = e.target.result
        pictures.setAttribute('src', e.target.result)
      }

      reader.readAsDataURL(avatar)
    }
  })
}

const renderListPicture = (imageFiles) => {
  var items = []
  var node = document.createElement("img")
  
  for (var i = 0, j = imageFiles.length; i < j; i++) {
    const avatar = imageFiles[i]
    const image = node.setAttribute('src', avatar)
    items.push(image)
  }
  return items
}
