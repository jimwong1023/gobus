(function(){

  var latitude, longitude
  var JekaEvent = $.extend({}, Backbone.Events);

  function getLocation(){
    console.log("getlocation");
    if (navigator.geolocation){
      navigator.geolocation.getCurrentPosition(showPosition);
      }
    else{ 
      console.log("Geolocation is not supported by this browser.");
      }    
  }

  function showPosition(position){
      // $.ajax({
      //   url: '/location/loc?lat=' + position.coords.latitude + "&long=" + position.coords.longitude,
      //   type: 'GET'
      // }).done(function(result){
      //     console.log(result)
      //   })
      latitude = position.coords.latitude
      longitude = position.coords.longitude

      JekaEvent.trigger('coordinates');
    }

  getLocation()

  var MapView = Backbone.View.extend({
    render: function () {
      handler = Gmaps.build('Google');
      handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
        markers = handler.addMarkers([
        {
            "lat": latitude,
            "lng": longitude,
            // "picture": {
            //   "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
            //   "width":  36,
            //   "height": 36
            // },
            // "infowindow": "hello!"
          }
        ]);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
      }); 
    }
  });

  var mapView = new MapView();

  var Router = Backbone.Router.extend({
    routes: {
      "":"home"
    }
  });

  var router = new Router;

  router.on('route:home', function() {
    mapView.render();
  });

  JekaEvent.on("coordinates", function() {
    Backbone.history.start();
  });

})();