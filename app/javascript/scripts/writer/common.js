export const onAddPictures = () => {
  const inputFileAvatar = document.querySelector('.js-post-img')
  const pictures = document.querySelector('#pictures-preview')
  const listPictures = document.querySelector('.list-pictures')


  if (!inputFileAvatar) return
  inputFileAvatar.addEventListener('change', (e) => {
    if (inputFileAvatar.files && inputFileAvatar.files[0]) {
      renderListPicture(inputFileAvatar.files).map(e => {
        listPictures.appendChild(e)
      })
    }

    if(listPictures.childElementCount == 6) {
      document.querySelector('.js-post-img-label').classList.add('hidden')
    }
  })
}

const renderListPicture = (imageFiles) => {
  var items = []
  Array.from(imageFiles).map((item, index) => {
    if(index > 5) return

    let reader = new FileReader()
    var node = document.createElement("div")
    node.setAttribute('img-data-id', index)
    reader.readAsDataURL(item)

    reader.onload = (e) => {
      node.style.backgroundImage = `url(${e.target.result})`
    }

    items.push(node)
  })
  console.log(items)
  return items
}


export const onAddImgBlog = () => {
  const inputFileAvatar = document.querySelector('.js-blog-img')
  if (!inputFileAvatar) return

  inputFileAvatar.addEventListener('change', (e) => {
    if (inputFileAvatar.files && inputFileAvatar.files[0]) {
      let reader = new FileReader()
      const avatar = inputFileAvatar.files[0]

      reader.onload = (e) => {
        this.avatarDataUri = e.target.result
        document.querySelector('#pictures-preview').setAttribute('src', e.target.result)
      }

      reader.readAsDataURL(avatar)
    }
  })
}
