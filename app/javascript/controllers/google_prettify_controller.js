import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="google-prettify"
export default class extends Controller {
  connect() {
    console.log("I");
    document.querySelectorAll("pre").forEach((block) => {
      block.classList.add("prettyprint");
    });
  }
}
