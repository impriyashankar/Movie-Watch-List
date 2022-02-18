
//new

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  show() {
    this.formTarget.classList.remove("d-none")
  }
}
