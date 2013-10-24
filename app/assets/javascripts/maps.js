(function(){
  "use strict";

  function getLocation(){
    if (navigator.geolocation){
      navigator.geolocation.getCurrentPosition(showPosition);
      }
    else{ 
      console.log("Geolocation is not supported by this browser.");
      }
    
    }
  function showPosition(position){
      console.log(position)
      $.ajax({
        url: '/location/loc?lat=' + position.coords.latitude + "&long=" + position.coords.longitude,
        type: 'GET'
      }).done(function(result){
          console.log(result)
        })
      // handler = Gmaps.build('Google');
      // handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
      //   markers = handler.addMarkers([
      //   {
      //       "lat": position.coords.latitude,
      //       "lng": position.coords.longitude,
      //       // "picture": {
      //       //   "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
      //       //   "width":  36,
      //       //   "height": 36
      //       // },
      //       // "infowindow": "hello!"
      //     }
      //   ]);
      //   handler.bounds.extendWith(markers);
      //   handler.fitMapToBounds();
      // }); 
    }
  getLocation()
})();