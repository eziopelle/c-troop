import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-preview"
export default class extends Controller {
  static targets = ["photo"];

  connect() {
    console.log(this.photoTarget)
  }

  test() {
    if (this.photoTarget) {
      this.displayPreview(this.photoTarget);
    }
  }

  displayPreview = (input) => {
    if (input.files && input.files[0]) {
      const reader = new FileReader();
      reader.onload = (event) => {
        document.getElementById('photo-preview').src = event.currentTarget.result;
      }
      reader.readAsDataURL(input.files[0])
      document.getElementById('photo-preview').classList.remove('hidden');
      document.getElementById('button-submit').classList.remove('d-none');
    }
  }
}
