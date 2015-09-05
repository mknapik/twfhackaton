angular.module('twf', ['ngResource', 'ngRoute', 'templates']);

angular.module('twf').config([
  '$httpProvider', '$routeProvider', '$locationProvider', function($httpProvider, $routeProvider, $locationProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    return $routeProvider.when('/', {
      templateUrl: "/assets/templates/page1.html",
      controller: 'Page1Ctrl'
    }).when('/page2', {
      templateUrl: '/assets/templates/page2.html',
      controller: 'Page2Ctrl'
    });
  }
]);
