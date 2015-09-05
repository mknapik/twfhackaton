app = angular.module('twf')

app.controller('GameDetailsModalCtrl', ['$scope', '$modalInstance', ($scope, $modalInstance) ->
  $scope.close = ->
    $modalInstance.dismiss('cancel')

  $scope.play = ->
# TODO: replace with the logic
    $modalInstance.dismiss('cancel')
])

