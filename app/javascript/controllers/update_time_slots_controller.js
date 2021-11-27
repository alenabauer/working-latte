import { Controller } from "stimulus";

export default class extends Controller {

  static targets = ["dateInput", "slot" ];

  connect() {
    console.log("Hello from Stimulus Controller.");
    console.log(this.slotTargets)
  }

  sendRequest(event) {
    event.preventDefault();
    const year = this.dateInputTargets[0].value;
    const month = this.dateInputTargets[1].value;
    const day = this.dateInputTargets[2].value;
    const url = `${this.data.get('url')}?year=${year}&month=${month}&day=${day}`;

    const myRequest = new Request(url, {
      method: 'GET',
      contentType: "application/json",
      cache: 'default',
    });

    fetch(myRequest)
      .then(response => response.json())
      .then((data) => {
        console.log(data);
      });
  }
}
