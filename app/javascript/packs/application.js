// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("@hotwired/turbo-rails")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// External imports
import "bootstrap";
import "controllers"
import "trix"
// require("trix")
require("@rails/actiontext")

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbo:load', () => {
  console.log("TURBO");

  // Call your functions here, e.g:
  // initSelect2();
});

// if (document.querySelector("span.main-color")) {

//   document.querySelector("span.main-color").animate(
//     {
//       filter: ['hue-rotate(0deg)', 'hue-rotate(360deg)']
//     },
//     {
//       duration: 10000,
//       iterations: Infinity
//     }
//   );

// }


