import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.scrollHandler = this.checkScroll.bind(this);
    window.addEventListener("scroll", this.scrollHandler);
  }

  disconnect() {
    window.removeEventListener("scroll", this.scrollHandler);
  }

  checkScroll() {
    this.element.classList.toggle(
      "animate-on-scroll",
      this.isVisible(this.element),
    );
  }

  isVisible(element) {
    const elementTop = element.getBoundingClientRect().top;
    const viewportBottom = window.innerHeight;

    // Change the '0' to whatever offset you'd like to use.
    return elementTop <= viewportBottom - 0;

  }
}
