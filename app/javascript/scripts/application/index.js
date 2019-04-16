import { configEditor } from './quill';
import { clickChangeLanguage, onClickBtnOpenDropdown, onClickBtnCloseAlert } from './common'
import { clickFollow } from './follow'
import { onClickBtnCommentLoadMore } from './comment'
import { clickBtnLogin, clickSignUp } from './signup'
import { onChangeTabModal, onClickBtnCloseModal, onClickBtnOpenModal } from './modal'
import { loadMoreMessage } from './load_more'

window.addEventListener('DOMContentLoaded', function () {
  configEditor()

  clickChangeLanguage()

  clickFollow()

  onClickBtnCommentLoadMore()

  onChangeTabModal()
  onClickBtnCloseModal()
  onClickBtnOpenModal()

  onClickBtnOpenDropdown()
  onClickBtnCloseAlert()

  clickBtnLogin()
  clickSignUp()
  
  loadMoreMessage()
})
