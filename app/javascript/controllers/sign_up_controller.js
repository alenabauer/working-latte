import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "button", "isCafeOwner" ]

  checkboxChange(){
    if (this.isCafeOwnerTarget.checked) {
      this.buttonTarget.value = "Register your Café"
    } else {
      this.buttonTarget.value = "Sign up"
    }
  }
}
