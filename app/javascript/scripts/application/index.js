import { clickChangeLanguage } from './common'

import Signup from './signup';

window.addEventListener('DOMContentLoaded', function () {
  clickChangeLanguage()
  
  new Signup().init()
})
