angular.module('twf')
    .factory('getGame', ['$http', function ($http) {
        return {
            get: function (callback, id) {
                $http.get("/api/games/" + id).
                    success(function (data) {
                        callback(data);
                    }).
                    error(function (data) {
                        callback("Request failed");
                    });
            }
        };
    }]);

angular.module('twf')
    .factory('postGame', ['$http', function ($http) {
        return {
            post: function (callback, id) {
                $http.post('/api/games/' + id + '/solution', {tiles: DraggModule.getCurrenConfiguration()}).
                    then(function (data) {
                        callback(data);
                    }, function (response) {
                        callback("Request failed");
                    });
            }
        };
    }
    ]);
