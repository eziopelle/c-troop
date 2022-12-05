import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {


  static targets = [ "map"]


  static values = {
    apiKey: String,
    markers: Array
  }



  connect() {




    this.transport = "walking"
    this.geolocation();
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: 'mapbox://styles/eziopelle97/clb9esa0t002014n0wfp7olit'
    })

    this.addMarkersToMap();
    this.fitMapToMarkers();


    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))

  }

  addMarkersToMap() {
    this.markersValue.forEach((marker) => {


      const popup = new mapboxgl.Popup().setHTML(marker.info_window)



      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "91px"
      customMarker.style.height = "65px"
      // customMarker.dataset.action = "click->map#direction"
      // customMarker.dataset.lat = marker.lat
      // customMarker.dataset.lng = marker.lng

      const infos = `<div class='infos'><span class="${marker.color}">${marker.pourcentage} %</span></div>`

      customMarker.insertAdjacentHTML("beforeend", infos)

      // market markers
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)

    })

    // const customLocomotion = document.createElement("div")
    // customLocation.className = "location"
    // customLocation.style.backgroundSize = "contain"
    // customLocation.style.width = "91px"
    // customLocation.style.height = "65px"
//
    // const locomotionInfo = `<div>
    // <ul class="list-locomotion">
      // <li><i class="fa-solid fa-bicycle"></i></li>
      // <li><i class="fa-solid fa-car"></i></li>
      // <li><i class="fa-solid fa-person-walking"></i></li>
    // </ul>
  // </div>`
//
    // customLocation.insertAdjacentHTML("beforeend", locomotionInfo)
//
    // new mapboxgl.customLocation(customMarker)

  }

  chooseTransportationMode(event) {
    event.preventDefault();

    document.querySelector('.selected').classList.remove('selected')

    event.currentTarget.classList.add('selected')

    this.transport = event.currentTarget.dataset.target

  }
    // User marker
  direction(event) {

    console.log(event.currentTarget)
    const markerlat = event.currentTarget.dataset.lat
    const markerlng = event.currentTarget.dataset.lng

    console.log(`https://api.mapbox.com/directions/v5/mapbox/${this.transport}/${this.userLong},${this.userLat};${markerlng},${markerlat}?steps=true&geometries=geojson&access_token=${this.apiKeyValue}`)
    console.log(markerlng)
    console.log(markerlat)

    fetch(`https://api.mapbox.com/directions/v5/mapbox/${this.transport}/${this.userLong},${this.userLat};${markerlng},${markerlat}?steps=true&geometries=geojson&access_token=${this.apiKeyValue}`,
      { method: 'GET' }
    )
    .then(response => response.json())
    .then(data => {
      console.log(data)
      const route = data.routes[0].geometry.coordinates;
      this.drawroute(route)

    })

  }

  drawroute(route) {
    const geojson = {
      type: 'Feature',
      properties: {},
      geometry: {
        type: 'LineString',
        coordinates: route
      }
    };
    if (this.map.getSource('route')) {
      this.map.getSource('route').setData(geojson);
    }
    // otherwise, we'll make a new request
    else {
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
          'line-color': '#3887be',
          'line-width': 5,
          'line-opacity': 0.75
        }
      });
    }
    // add turn instructions here at the end
  }


  addUserMarkerToMap(userLat, userLong) {
    new mapboxgl.Marker()
    .setLngLat([ userLong, userLat ])
    .addTo(this.map)
  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }


  success(pos) {

    const crd = pos.coords;

    console.log('Your current position is:');
    console.log(`Latitude : ${crd.latitude}`);
    console.log(`Longitude: ${crd.longitude}`);
    console.log(`More or less ${crd.accuracy} meters.`);

    this.userLat = crd.latitude;
    this.userLong = crd.longitude;
    this.addUserMarkerToMap(this.userLat, this.userLong);
  }

  #error(err) {
    console.warn(`ERROR(${err.code}): ${err.message}`);
  }

  geolocation() {
    this.options = {
      enableHighAccuracy: true,
      timeout: 5000,
      maximumAge: 0
    };
    navigator.geolocation.getCurrentPosition(this.success.bind(this), this.#error, this.options);

  }









}
