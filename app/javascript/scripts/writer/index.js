import { configEditor, postContentQuill } from './quill';
import { onAddPictures } from './common'

window.addEventListener('DOMContentLoaded', function () {
  onAddPictures()
  
  configEditor()
  const container = document.getElementById('post-content-quill')
})
