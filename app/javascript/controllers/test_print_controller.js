import { Controller } from "stimulus"

export default class extends Controller {

  initialize () {
    // is called once per controller
  }

  connect () {
    // is called evvery time the controller is connected to the DOM.
    console.log("I'm connect!!!!");
  }
  makeRequestNow() {
    console.log("request was made (not really)");
  }
  disconnect () {
    // called when controller element is removed from the document:
  }
}
