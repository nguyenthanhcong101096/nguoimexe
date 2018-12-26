import { clickChangeLanguage } from './common'
import { onClickBtnCommentLoadMore, onClickBtnCommentCreate } from './comment'
import Signup from './signup';

window.addEventListener('DOMContentLoaded', function () {
  clickChangeLanguage()
   
  onClickBtnCommentLoadMore()
  onClickBtnCommentCreate()
  
  new Signup().init()
})
