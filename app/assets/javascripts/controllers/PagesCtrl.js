var Page1Ctrl, app;

app = angular.module('twf');

Page1Ctrl = function($scope,$timeout, getGame, postGame, $routeParams) {
  $scope.title = "Hello, page1!";
  $scope.currentCategory = 0;

  getGame.get(function(data){
      $scope.description = data.description;
      $scope.categories = data.tile_sets;
      $scope.tiles = data.tile_sets[$scope.currentCategory].tiles;
      $timeout(function(){
        DraggModule.makeDraggable();
      });
  }, $routeParams.id);
  $scope.openPopup = function($event) {
      TweenMax.to($(event.target), 0.2, {  opacity: 0, ease:Linear.easeNone});
      TweenMax.to($(event.target).parent(), 0.6, {  scale: 40,x:900, y:900,z:-20, ease:Linear.easeNone});
      TweenMax.to($(".task-popup"), 1, {  opacity: 1, ease:Linear.easeNone, delay: 0.5});
      TweenMax.to($(".task-popup"), 1, {  css:{zIndex:1000}, ease:Linear.easeNone, delay: 0.5});
      TweenMax.to($(event.target), 1, {  opacity: 1, ease:Linear.easeNone,delay: 2});
  }
  $scope.closePopup = function($event) {
      TweenMax.to($(".task-popup"), 0.6, {  opacity: 0, ease:Linear.easeNone});
      TweenMax.to($(".task-popup"), 0.6, {  css:{zIndex:-1}, ease:Linear.easeNone});
      TweenMax.to($(".open-popup"), 0.6, {  scale: 1,x:01, y:0,z:0, ease:Linear.easeNone});
  }
  $scope.closePopupRating = function($event) {
      TweenMax.to($(".rating-popup"), 0.6, {  opacity: 0, ease:Linear.easeNone});
      TweenMax.to($(".rating-popup"), 0.6, {  css:{zIndex:-1}, ease:Linear.easeNone});
  }
  $scope.playSound = function($event) {
      $(".task-text").speak();
  }
  $scope.finishGame = function($event) {
      postGame.post(function(data){
        $scope.rating = data.data.rating;
        console.log(data.data.rating);
          TweenMax.to($(".rating-popup"), 1, {  opacity: 1, ease:Linear.easeNone});
          TweenMax.to($(".rating-popup"), 1, {  css:{zIndex:1000}, ease:Linear.easeNone,}); 
      },$routeParams.id);
  }
  $scope.playAgain = function($event) {
  }
};
app.controller('Page1Ctrl', ['$scope', '$timeout', 'getGame', 'postGame', '$routeParams', Page1Ctrl]);

