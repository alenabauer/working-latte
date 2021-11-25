// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"

document.addEventListener('turbolinks:load', () => {
  let yearInput = document.querySelector("#reservation_date_1i");
  let monthInput = document.querySelector("#reservation_date_2i");
  let dayInput = document.querySelector("#reservation_date_3i");
  yearInput.addEventListener('change', (e) => {
    console.log(e.target.value, monthInput.value, dayInput.value, document.querySelector(".reservation_time_slots"))
  })
  monthInput.addEventListener('change', (e) => {
    console.log(yearInput.value, e.target.value, dayInput.value);
  })
  dayInput.addEventListener('change', (e) => {
    console.log(yearInput.value, monthInput.value, e.target.value);
  })
})
