var Page1Ctrl, Page2Ctrl, app;

app = angular.module('twf');

Page1Ctrl = function($scope,$timeout, getGame) {
  $scope.title = "Hello, page1!";
  $scope.currentCategory = 0;
  getGame.get(function(data){
      $scope.description = data.description;
      $scope.categories = data.tile_sets;
      $scope.data = data;
      $scope.tiles = data.tile_sets[$scope.currentCategory].tiles;
      
      $timeout(function(){
            DraggModule.makeDraggable();
      });
      
  });
  $scope.openPopup = function($event) {
      TweenMax.to($(event.target), 0.2, {  opacity: 0, ease:Linear.easeNone});
      TweenMax.to($(event.target).parent(), 0.6, {  scale: 40,x:900, y:900,z:-20, ease:Linear.easeNone});
      TweenMax.to($(".task-popup"), 1, {  opacity: 1, ease:Linear.easeNone, delay: 0.5});
      TweenMax.to($(".task-popup"), 1, {  css:{zIndex:1000}, ease:Linear.easeNone, delay: 0.5}); 
      TweenMax.to($(event.target), 1, {  opacity: 1, ease:Linear.easeNone,delay: 2});
  }
  $scope.closePopup = function($event) {
      TweenMax.to($(".task-popup"), 0.4, {  opacity: 0, ease:Linear.easeNone});
      TweenMax.to($(".task-popup"), 0.4, {  css:{zIndex:-1}, ease:Linear.easeNone}); 
      TweenMax.to($(".open-popup"), 0.4, {  scale: 1,x:01, y:0,z:0, ease:Linear.easeNone});
  }
  $scope.playSound = function($event) {
      event.stopPropagation();
      $(event.target).parent().parent().speak();
  }
  $scope.switchCategory = function($event) {
      var id = $(event.target).attr("id");
      $scope.currentCategory = id;
      $scope.tiles = $scope.data.tile_sets[$scope.currentCategory].tiles;
  }
};


Page2Ctrl = function($scope) {
  return $scope.title = "Yo, page2!";
};

app.controller('Page1Ctrl', ['$scope','$timeout','getGame', Page1Ctrl]);

app.controller('Page2Ctrl', ['$scope', Page2Ctrl]);
