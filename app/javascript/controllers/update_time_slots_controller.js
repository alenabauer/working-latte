import { Controller } from "stimulus";
import Rails from "@rails/ujs";

export default class extends Controller {

  static targets = ["dateInput", "slot", "ajaxRequestUrl"];

  connect() {
    console.log("Hello from Stimulus Controller.")
  }

  sendRequest(event) {
    event.preventDefault();
    console.log(this.dateInputTargets);
    const year = this.dateInputTargets[0].value;
    const month = this.dateInputTargets[1].value;
    const day = this.dateInputTargets[2].value;
    const url = `${this.data.url}?year=${year}&month=${month}&day=${day}`;
    console.log(url);

    fetch(url, {
      headers: { 'Accept': "application/json" } })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      });
  }

}
