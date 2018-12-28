import { clickChangeLanguage } from './common'
import { clickFollow } from './follow'

import { onClickBtnCommentLoadMore, onClickBtnCommentCreate } from './comment'
import Signup from './signup';

window.addEventListener('DOMContentLoaded', function () {
  clickChangeLanguage()
  clickFollow()
  
  onClickBtnCommentLoadMore()
  onClickBtnCommentCreate()
  
  new Signup().init()
})
