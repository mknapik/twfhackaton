var app = angular.module('twf');

app.directive('owlCarousel', ['$timeout', function ($timeout) {
    return {
        link: function link(scope, element, attrs) {
            $timeout(function () {
                $(element).owlCarousel({
                    autoPlay: parseInt(attrs.autoplay) || 10000,
                    responsive: true,
                    navigation: true,
                    navigationText: [
                      "<i class='fa fa-angle-left'></i>",
                      "<i class='fa fa-angle-right'></i>"
                    ],
                });
            });
        }
    };
}]);