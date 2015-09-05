var app = angular.module('twf');

app.directive('owlCarousel', ['$timeout', '$rootScope', function ($timeout, $rootScope) {
    return {
        link: function link(scope, element, attrs) {
            scope.$watch('initOwl', function () {
                $(element).owlCarousel({
                    autoPlay: parseInt(attrs.autoplay) || 10000,
                    responsive: true,
                    pagination: true,
                    navigation: false,
                    navigationText: [
                      "<i class='fa fa-angle-left'></i>",
                      "<i class='fa fa-angle-right'></i>"
                    ]
                });
            });
        }
    };
}]);
