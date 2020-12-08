// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

import { initSelect2 } from '../plugins/init_select2';
import { removeShake } from '../plugins/shake';
import { initChatroomCable } from '../channels/user_channel';
import { carousel } from '../plugins/carousel';
import { initSweetalert } from '../plugins/init_sweetalert';


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
const el = document.createElement('div')
el.innerHTML = '<a href="https://www.treedom.net/en/" target="_blank">Link!</a>'

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initChatroomCable();
  initSelect2();
  removeShake();
  initSweetalert('#sweet-alert-demo', {
    title: "Challenge wasn't finished?",
    // text: "May be to plant a tree, then...",
    icon: "warning",
    content: {
      element: "a",
      attributes: {
        href: "https://www.treedom.net/en/",
        target: "_blank",
        text: "May be to plant a tree, then..."
      }
    }
  }, (value) => {
    if (value) {
      const link = document.querySelector('#delete-link');
      link.click();
    }
  })
  carousel();
})








