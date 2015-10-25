angular.module('twf').directive("myClose", function($animate){
    return {
        restrict: 'A',
        link: function(scope, elem, attrs){
            scope.$watch(attrs.myClose, function(value){
                
                TweenMax.to($(elem).parents(".popup-wrapper").next().find(".open-popup"), 0.2, {  scale: 1,x:01, y:0,z:0, ease:Linear.easeNone});
                TweenMax.to($(elem).parents(".popup-wrapper").next().find("i"), 0.2, {  opacity: 1, ease:Linear.easeNone});
                TweenMax.to(elem, 0.7, {'opacity': 0});
                TweenMax.to(elem, 1, {  css:{zIndex:-1}, ease:Linear.easeNone});
            });
        }
    };
});

angular.module('twf').directive("myOpen", function($animate){
    return {
        restrict: 'A',
        link: function(scope, elem, attrs){
            scope.$watch(attrs.myOpen, function(newValue, oldValue){
                if (newValue !== oldValue) {
                    TweenMax.to($(elem).find("i"), 0.2, {  opacity: 0, ease:Linear.easeNone});
                    TweenMax.to(elem, 0.5, { scale: 40,x:900, y:900,z:-20, ease:Linear.easeNone});
                    TweenMax.to($(elem).parents("header").prev().find(".task-popup"), 0.1, {  css:{zIndex:10000}, ease:Linear.easeNone});
                    TweenMax.to($(elem).parents("header").prev().find(".task-popup"), 0.3, {  opacity: 1, ease:Linear.easeNone});
                }
            });
        }
    };
});