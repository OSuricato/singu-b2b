import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Get references to the background and content elements
    this.background = this.element.querySelector(".home-banner-bg");
    this.content = this.element.querySelector(".home-banner-content");

    // Add event listeners for mousemove and mouseleave
    this.element.addEventListener("mousemove", this.moveBackground.bind(this));
    this.element.addEventListener("mouseleave", this.resetBackground.bind(this));
  }

  moveBackground(event) {
    const x = event.clientX / window.innerWidth;
    const y = event.clientY / window.innerHeight;

    this.background.style.transform = `translate(-${x * 20}px, -${y * 20}px)`;
  }

  resetBackground() {
    this.background.style.transform = "translate(0, 0)";
  }
}
