var app = angular.module('twf');

app.directive('owlCarousel', function () {
    return {
        link: function link(scope, element, attrs) {
            $(element).owlCarousel({
                autoPlay: parseInt(attrs.autoplay) || 0,
                responsive: true,
                navigation: true
            })
        }
    };
});