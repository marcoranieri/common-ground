import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form"]

  // connect() {
  // }

  toggle(event) {
    event.preventDefault()
    this.formTarget.classList.toggle("d-none")
  }
}
