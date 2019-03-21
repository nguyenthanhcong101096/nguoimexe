import { configEditor } from './quill';
import { clickChangeLanguage, onClickBtnOpenUserNav } from './common'
import { clickFollow } from './follow'
import { onClickBtnCommentLoadMore } from './comment'

import { onChangeTabModal, onClickBtnCloseModal, onClickBtnOpenModal } from './modal'

window.addEventListener('DOMContentLoaded', function () {
  configEditor()

  clickChangeLanguage()

  clickFollow()

  onClickBtnCommentLoadMore()

  onChangeTabModal()
  onClickBtnCloseModal()
  onClickBtnOpenModal()

  onClickBtnOpenUserNav()
})
