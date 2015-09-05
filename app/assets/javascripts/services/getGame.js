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
  
  angular.module('twf')
    .factory('postGame', ['$http', function($http){
        return{
            post: function (callback) {

                $http.post('/api/games/1/solution', {tiles: DraggModule.getCurrenConfiguration()}).
                        then(function (data) {
                            callback(data);
                        }, function (response) {
                            callback("Request failed");
                        });
            }
        };
      }
    ]);