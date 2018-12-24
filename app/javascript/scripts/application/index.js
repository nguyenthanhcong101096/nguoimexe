import { clickChangeLanguage } from './common'
import { onClickBtnCommentLoadMore } from './comment'
import Signup from './signup';

window.addEventListener('DOMContentLoaded', function () {
  clickChangeLanguage()
  onClickBtnCommentLoadMore()
  
  new Signup().init()
})
