app = angular.module('twf')

Page1Ctrl = ($scope) ->
  $scope.title = "Hello, page1!"

Page2Ctrl = ($scope) ->
  $scope.title = "Yo, page2!"

app.controller('Page1Ctrl', ['$scope', Page1Ctrl])
app.controller('Page2Ctrl', ['$scope', Page2Ctrl])
