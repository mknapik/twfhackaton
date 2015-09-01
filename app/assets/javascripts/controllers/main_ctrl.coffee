app = angular.module('twf')

MainCtrl = ($scope) ->
  $scope.name = "MK"

app.controller('MainCtrl', ['$scope', MainCtrl])
