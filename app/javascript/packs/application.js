import '../styles/application.scss'
import '../scripts/application'

require.context('../images/', true)
// Support component names relative to this directory:
var componentRequireContext = require.context("components", true)
var ReactRailsUJS = require("react_ujs")
ReactRailsUJS.useContext(componentRequireContext)
