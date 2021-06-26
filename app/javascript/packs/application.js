// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require bootstrap

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import 'application/sweet-alert-confirm'

Rails.start()
Turbolinks.start()
ActiveStorage.start()


window.hideIt = function(event, display) {
  event.preventDefault();
  event.target.closest(".hide-elem").style.display = display;
}
