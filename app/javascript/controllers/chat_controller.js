import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'container', 'submitButton', 'messageBox', 'fileLoader' ]

  initialize() {
    this.containerTarget.scrollTop = 10000;
    this.containerTarget.scrollIntoView(false)
    this.messageBoxTarget.addEventListener("keydown", (event) => {
      if (event.key === "Enter") {
        event.preventDefault() && event.stopImmediatePropagation();
        this.messageBoxTarget.value != "" && this.submitForm();
      }
    })
  }

  submitForm(){
    this.submitButtonTarget.click()
    this.messageBoxTarget.value = ''
  }

  clickFileLoader(){
    this.fileLoaderTarget.click()
  }
}
