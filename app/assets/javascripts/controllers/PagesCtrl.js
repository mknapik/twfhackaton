var Page1Ctrl, Page2Ctrl, app;

app = angular.module('twf');

Page1Ctrl = function($scope) {
  $scope.title = "Hello, page1!";
  $scope.popupIsVisible = false;
  $scope.openPopup = function($event) {
      console.log(event.target);
      TweenMax.to($(event.target), 3, {  opacity: 0, ease:Linear.easeNone})
      TweenMax.to($(event.target).parent(), 3, {  scale: 40, ease:Linear.easeNone})
      TweenMax.to($(event.target).parent(), 5, {  x:1000, y:1000,z:-20, ease:Linear.easeNone})
      //$scope.popupIsVisible = true;
  }
};

Page2Ctrl = function($scope) {
  return $scope.title = "Yo, page2!";
};

app.controller('Page1Ctrl', ['$scope', Page1Ctrl]);

app.controller('Page2Ctrl', ['$scope', Page2Ctrl]);
