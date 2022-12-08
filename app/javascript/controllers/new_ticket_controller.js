import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-ticket"
export default class extends Controller {
  connect() {
    console.log("Holaaaa")
  }
}
