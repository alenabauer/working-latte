import { Controller } from "stimulus";

export default class extends Controller {

  static targets = ["dateInput", "collection", "slot" ];

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
        let html = "";
        $.each(data, function (key, value) {
          const start_time = new Date(value.start_time)
          html += `<div class="timeslot-item"><input class="form-check-input check_boxes optional timeslot-selector" type="checkbox" value="${value.id}" name="reservation[time_slot_ids][]" id="reservation_time_slot_ids_${value.id}"><label class ="form-check-label collection_check_boxes" for="reservation_time_slot_ids_${value.id}">${start_time.getHours()}:00</label></div>`;
        });
        $('#time-slot-selection').html(html);
      });
  }
}
