import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["So many books, so little time", "Books are a uniquely portable magic."],
      typeSpeed: 30,
      loop: true
    })
  }
}
