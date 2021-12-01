import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  successLocation(position) {
    console.log(position);
    this.generateMap([position.coords.longitude, position.coords.latitude])
  }

  generateMap(center) {
    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/alenabauer/ckwdpi55b28ty14kobw7pfet0',
      center: center,
      zoom: 15
    });

    const nav = new mapboxgl.NavigationControl();
    this.map.addControl(nav)

    this._addMarkersToMap();

    this._getRoute(center, [this.markersValue[0].lng, this.markersValue[0].lat]);
    this._fitMapToRoute(center, [this.markersValue[0].lng, this.markersValue[0].lat]);
  }

  errorLocation() {
    window.alert("Your location couldn't be detected.")
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    navigator.geolocation.getCurrentPosition(
      position => this.successLocation(position),
      () => this.errorLocation(),
      { enableHighAccuracy: true }
    );
  }

  _addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement('div');
      customMarker.className = 'marker';
      customMarker.innerHTML = '<i class="fas fa-coffee"></i>';
      customMarker.style.fontSize = '24px';
      customMarker.style.textShadow = '1px 1px 2px black';
      customMarker.style.color = '#1AB8C7';

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    });
  }

  _fitMapToRoute(start, end) {
    const bounds = new mapboxgl.LngLatBounds();
    bounds.extend(start);
    bounds.extend(end);
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  // create a function to make a directions request
  async _getRoute(start, end) {
    // make a directions request using walking profile
    const query = await fetch(
      `https://api.mapbox.com/directions/v5/mapbox/walking/${start[0]},${start[1]};${end[0]},${end[1]}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
      { method: 'GET' }
    );
    const json = await query.json();
    const data = json.routes[0];
    const route = data.geometry.coordinates;
    const geojson = {
      type: 'Feature',
      properties: {},
      geometry: {
        type: 'LineString',
        coordinates: route
      }
    };
    // if the route already exists on the map, we'll reset it using setData
    // if (map.getSource('route')) {
    //   map.getSource('route').setData(geojson);
    // }
    // otherwise, we'll make a new request
    this.map.addLayer({
      id: 'route',
      type: 'line',
      source: {
        type: 'geojson',
        data: geojson
      },
      layout: {
        'line-join': 'round',
        'line-cap': 'round'
      },
      paint: {
        'line-color': '#1AB8C7',
        'line-width': 4,
        'line-opacity': 0.7
      }
    });
    this.map.addLayer({
      id: 'point',
      type: 'circle',
      source: {
        type: 'geojson',
        data: {
          type: 'FeatureCollection',
          features: [
            {
              type: 'Feature',
              properties: {},
              geometry: {
                type: 'Point',
                coordinates: start
              }
            }
          ]
        }
      },
      paint: {
        'circle-radius': 10,
        'circle-color': '#1AB8C7'
      }
    });
    // add turn instructions here at the end
  }

  // map.on('load', () => {
  //   // make an initial directions request that
  //   // starts and ends at the same location
  //   getRoute(start);

  //   // Add starting point to the map
  //   map.addLayer({
  //     id: 'point',
  //     type: 'circle',
  //     source: {
  //       type: 'geojson',
  //       data: {
  //         type: 'FeatureCollection',
  //         features: [
  //           {
  //             type: 'Feature',
  //             properties: {},
  //             geometry: {
  //               type: 'Point',
  //               coordinates: start
  //             }
  //           }
  //         ]
  //       }
  //     },
  //     paint: {
  //       'circle-radius': 10,
  //       'circle-color': '#3887be'
  //     }
  //   });
  //   // this is where the code from the next step will go
  // });
}
