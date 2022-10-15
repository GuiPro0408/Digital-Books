import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["A reader lives a thousand lives before he dies", "Books are a uniquely portable magic."],
      typeSpeed: 30,
      loop: true
    })
  }
}
