// ./packs/application.js
import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'

const application = Application.start()
const context = require.context('../controllers', true, /\.js$/)
application.load(definitionsFromContext(context))

// import Flatpickr
import Flatpickr from 'stimulus-flatpickr'

// Import style for flatpickr
require("flatpickr/dist/themes/airbnb.css");

// Manually register Flatpickr as a stimulus controller
application.register('flatpickr', Flatpickr)
