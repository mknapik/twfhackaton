var app = angular.module('twf');

app.controller('Page1Ctrl', ['$scope', '$timeout', 'getGame', 'postGame', '$routeParams','$location', function ($scope, $timeout, getGame, postGame, $routeParams, $location) {
    $scope.currentCategory = 0;
    $scope.gameId = $routeParams.id;
    $scope.closePopup = true;
    $scope.openPopup = false;
    
    $scope.init = function () {
        DraggModule.reset();

        getGame.get(function(data) {
            $scope.description = data.description;
            $scope.categories = data.tile_sets;
            $scope.data = data;
            $timeout(function(){
                DraggModule.makeDraggable();
            });
        }, $scope.gameId);
    };

    $scope.init();



  $scope.closePopupRating = function($event) {
      TweenMax.to($(".rating-popup"), 0.4, {  opacity: 0, ease:Linear.easeNone});
      TweenMax.to($(".rating-popup"), 1, {  css:{zIndex:-1}, ease:Linear.easeNone});
  };

  $scope.playSound = function($event) {
      event.stopPropagation();
      $(event.target).parents(".read-text").speak();
  };
 
  $scope.finishGame = function($event) {
      postGame.post(function(data) {
        $scope.rating = data.data.rating;
          $scope.ratingStars = [];

          for (var i = 0; i < parseInt(data.data.rating); i++) {
              $scope.ratingStars.push(i + 1);
          }

        TweenMax.to($(".rating-popup"), 1, {  opacity: 1, ease:Linear.easeNone});
        TweenMax.to($(".rating-popup"), 0.1, {  css:{zIndex:10000}, ease:Linear.easeNone,});
      }, $routeParams.id);
  };

    $scope.closeGame = function () {
        $location.path('/');
    };

  $scope.playAgain = function($event) {
    $scope.init();

    TweenMax.to($(".rating-popup"), 0.6, {  opacity: 0, ease:Linear.easeNone});
    TweenMax.to($(".rating-popup"), 0.6, {  css:{zIndex:-1}, ease:Linear.easeNone});
  };
  
   $scope.switchCategory = function($event) {
      var id = $(event.target).attr("id");
      $scope.currentCategory = id;
      //$scope.tiles = $scope.data.tile_sets[$scope.currentCategory].tiles;
      //$scope.categories = data.tile_sets;
      $timeout(function() {
        DraggModule.loadCurrentConfiguration();
      });
    };
}]);

