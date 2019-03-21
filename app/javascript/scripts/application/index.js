import { configEditor } from './quill';
import { clickChangeLanguage, onClickBtnOpenUserNav } from './common'
import { clickFollow } from './follow'
import { onClickBtnCommentLoadMore } from './comment'
import { clickBtnLogin, clickSignUp } from './signup'
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
  
  clickBtnLogin()
  clickSignUp()
})
