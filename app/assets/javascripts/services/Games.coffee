app = angular.module('twf')

Games = ($resource) ->
  $resource('/api/games')

app.factory('Games', ['$resource', Games])
