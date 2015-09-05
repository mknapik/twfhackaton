app = angular.module('twf')

app.controller('NewGameSetCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.title = ''
  $scope.description = ''

  $http.get('/tiles').success((data) ->
    $scope.phones = data
  )
])
