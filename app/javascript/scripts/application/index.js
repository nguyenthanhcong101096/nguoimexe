import { clickChangeLanguage } from './common'
import { clickFollow } from './follow'
import { onClickBtnCommentLoadMore } from './comment'

window.addEventListener('DOMContentLoaded', function () {
  clickChangeLanguage()
  clickFollow()
  
  onClickBtnCommentLoadMore()
})
