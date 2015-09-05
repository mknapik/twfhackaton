var app;

app = angular.module('twf');

app.controller('NewGameSetCtrl', [
  '$scope', '$http', function($scope, $http) {
    $scope.title = '';
    $scope.description = '';
    return $http.get('/tiles').success(function(data) {
      return $scope.phones = data;
    });
  }
]);
