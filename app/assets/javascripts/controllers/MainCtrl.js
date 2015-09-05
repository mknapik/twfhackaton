var MainCtrl, app;

app = angular.module('twf');

MainCtrl = function($scope) {
  return $scope.name = "MK";
};

app.controller('MainCtrl', ['$scope', MainCtrl]);
