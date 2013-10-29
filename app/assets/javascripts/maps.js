(function(){

  var latitude, longitude
  var JekaEvent = $.extend({}, Backbone.Events);

  function getLocation(){
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

  var Route = Backbone.Model.extend();
  var Routes = Backbone.Collection.extend({
      Model: Route,
      // url: "#"
  });
  var routes = new Routes();

  var Stop = Backbone.Model.extend({
    urlroot: "/location/loc?lat=" + latitude + "&long=" + longitude
  });
  var Stops = Backbone.Collection.extend({
      // Model: Stop,
    url: "/location/loc?lat=" + latitude + "&long=" + longitude
  });
  var stops = new Stops();

  var MapView = Backbone.View.extend({
    renderMap: function () {
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
    },
    renderStops: function () {
      console.log("poo")
    }
  });

  var mapView = new MapView();

  var Router = Backbone.Router.extend({
    routes: {
      "": "home",
    }
  });

  var router = new Router;

  router.on('route:home', function() {
    console.log('home')
    mapView.renderMap();
    mapView.renderStops();
  });

  JekaEvent.on("coordinates", function() {
    Backbone.history.start();
  });

})();