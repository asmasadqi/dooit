import { dynamicRating } from "../plugins/starsInReviewForm";

document.addEventListener('turbolinks:load', () => {
  // [...]
  dynamicRating();
})
