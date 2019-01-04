import { configEditor, postContentQuill } from './quill';
import { onAddPictures, onAddImgBlog } from './common'

window.addEventListener('DOMContentLoaded', function () {
  onAddPictures()
  onAddImgBlog()
  
  configEditor()
  const container = document.getElementById('post-content-quill')
})
