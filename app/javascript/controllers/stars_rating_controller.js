import { dynamicRating } from "../plugins/starsInReviewForm";
const test = document.querySelector(".test")
console.log("test")

document.addEventListener('turbolinks:load', () => {
  // [...]
  dynamicRating();
})
