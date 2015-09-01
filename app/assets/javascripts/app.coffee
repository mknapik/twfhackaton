angular.module('twf', ['ngResource'])

angular.module('twf').config(['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])
