import { clickChangeLanguage } from './common'
import { clickFollow } from './follow'
import { enterCreateMesssage } from './message'
import { onClickBtnCommentLoadMore, onClickBtnCommentCreate } from './comment'
//import Signup from './signup';

window.addEventListener('DOMContentLoaded', function () {
  enterCreateMesssage()
  
  clickChangeLanguage()
  clickFollow()
  
  onClickBtnCommentLoadMore()
  
 // new Signup().init()
})
