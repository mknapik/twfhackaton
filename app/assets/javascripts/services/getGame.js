angular.module('twf')
  .factory('getGame', ['$http', function($http){
    return{
      get: function(callback, id){
        $http.get("/api/games/" + id).
          success(function(data) {
            callback(data);
          }).
          error(function (data) {
               callback("Request failed");
          });
      }
    };
  }]);
