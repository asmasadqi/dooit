import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}

// const arrow = document.querySelector(".arrow");
// const description = document.querySelector(".description");

// arrow.addEventListener("click", function() {
//   if (description.style.maxHeight) {
//     description.style.maxHeight = null;
//     arrow.textContent = "▼";
//   } else {
//     description.style.maxHeight = description.scrollHeight + "px";
//     arrow.textContent = "▲";
//   }
// });
