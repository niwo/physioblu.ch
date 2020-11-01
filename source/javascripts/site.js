var mymap = L.map('mapid').setView([47.1400, 7.24600], 16);

L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1Ijoibml3byIsImEiOiJja2d6MTV4cnowM3p0MnNxbGpwZ2liYnJjIn0.gKBxjoDE-6TisNXKdCjLsw', {
  maxZoom: 18,
  attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
    '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
    'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
  id: 'mapbox/streets-v11',
  tileSize: 512,
  zoomOffset: -1
}).addTo(mymap);

L.marker([47.13970, 7.24576]).addTo(mymap)
  .bindPopup("<b>PhysioBlu</b><br />Nidaugasse 22<br />2502 Biel/Bienne").openPopup();
