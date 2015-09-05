angular.module('twf')
  .factory('getGame', ['$http', function($http){
    return{
      get: function(callback){
        $http.get("/api/games/1").
          success(function(data) {
            callback(data);
          }).
          error(function (data) {
               callback("Request failed");
          });
      }
    };
  }]);