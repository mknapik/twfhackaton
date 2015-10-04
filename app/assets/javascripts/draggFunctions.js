var DraggModule = function () {

    var config = {
        placecholderClass: 'placeholder',
        elementSelector: '.tile-item',
        draggableContainer: '.container-fluid'
    };

    var draggedElementStartPosition = {
        x: 1,
        y: 1
    };

    var placecholdersReferences;

    var rollback = false;

    PlacecholderModel = [];

    var markActivePlacecholder = function (index) {
        /*
         * Makes placeholder highligted when image on it
         */

        jQuery(placecholdersReferences).each(function(placeholder_id){
            if (index == placeholder_id)
                jQuery(this).addClass('active');
            else
                jQuery(this).removeClass('active');
        });
    };

    var getCurrenConfiguration = function () {
        /*
         * Returns current configuration for answers
         */
        var result = [];
        for (var i in PlacecholderModel) {
            if (PlacecholderModel.hasOwnProperty(1) && PlacecholderModel[i].elementIside) {
                result.push(PlacecholderModel[i].id);
            }
        }
        return result;

    };
    function elenemtIsOnPlaceholder(element, ignoreOcupated) {

        var result = false;

        var elementCordinates = element.getBoundingClientRect();
        var elementCeneter = {
            x: (elementCordinates.bottom - elementCordinates.height / 2),
            y: (elementCordinates.right - elementCordinates.width / 2)
        };
        for (var i in placecholdersReferences) {
            if (placecholdersReferences.hasOwnProperty(i)) {
                if (PlacecholderModel[i].elementIside && !ignoreOcupated) {
                    continue;
                }
                var placecholderCordinates = placecholdersReferences[i].getBoundingClientRect();
                if (elementCordinates.bottom > placecholderCordinates.top
                        && elementCordinates.top < placecholderCordinates.bottom
                        && elementCordinates.right > placecholderCordinates.left
                        && elementCordinates.left < placecholderCordinates.right
                        ) {

                    var placecholderCeneter =
                            {
                                x: (placecholderCordinates.bottom - placecholderCordinates.height / 2),
                                y: (placecholderCordinates.right - placecholderCordinates.width / 2)
                            };

                    var distance = Math.sqrt((elementCeneter.x - placecholderCeneter.x) * (elementCeneter.x - placecholderCeneter.x) + (elementCeneter.y - placecholderCeneter.y) * (elementCeneter.y - placecholderCeneter.y));
                    if (!result || result.distance > distance) {
                        result = {
                            index: i,
                            distance: distance,
                            x: draggedElementStartPosition.x - placecholderCordinates.left,
                            y: draggedElementStartPosition.y - placecholderCordinates.bottom
                        };
                    }
                }
            }

        }
        if (result) {
            markActivePlacecholder(result.index);
        } else {
            markActivePlacecholder(-1);
        }

        return result;

    }


    var makeDraggable = function () {

        console.log('Make draggable');
        placecholdersReferences = document.getElementsByClassName(config.placecholderClass);

        for (var i in placecholdersReferences) {
            if (placecholdersReferences.hasOwnProperty(i)) {
                PlacecholderModel[i] = {
                    elementIside: false
                };
            }

        }

        var DraggableObject = Draggable.create(config.elementSelector, {
            bounds: config.draggableContainer,
            edgeResistance: 0.65,
            type: "x,y",
            throwProps: true,
            autoScroll: true,
            liveSnap: true,
            onPress: function (b, a) {
                draggedElementStartPosition = {
                    x: this.target.getBoundingClientRect().left,
                    y: this.target.getBoundingClientRect().bottom
                };
                var isAdded = elenemtIsOnPlaceholder(this.target, true);
                if (isAdded) {
                    PlacecholderModel[isAdded.index].elementIside = false;
                    setTimeout(function(){markActivePlacecholder(-1);},300);
                    rollback = true;
                    delete PlacecholderModel[isAdded.index].id;

                }
            },
            onDragEnd: function (a, b) {

                var currentPlacecholder = elenemtIsOnPlaceholder(this.target);
                if (currentPlacecholder && !rollback) {
                    PlacecholderModel[currentPlacecholder.index].elementIside = true;
                    PlacecholderModel[currentPlacecholder.index].id = this.target.getAttribute("data-id");
                    TweenLite.to(this.target, 0.5, {
                        x: -currentPlacecholder.x,
                        y: -currentPlacecholder.y,
                        delay: 0.1
                    });

                } else {
                    TweenLite.to(this.target, 0.5, {
                        x: 0,
                        y: 0,
                        delay: 0.1
                    });
                }
                rollback = false;
            },
            snap: {
                x: function (endValue) {
                    elenemtIsOnPlaceholder(this.target);
                    return endValue; //Math.round(endValue / 100) * 100;
                },
                y: function (endValue) {
                    return endValue;
                }
            }
        });
    };

    var reset = function () {
        var elts = document.getElementsByClassName(config.placecholderClass);

        for (var i in elts) {
            if (elts[i].classList && elts[i].classList.contains('active')) {
                elts[i].classList.remove('active');
            }
        }
    };

    var loadCurrentConfiguration = function(){
        console.log(PlacecholderModel);
    };

    return {
        makeDraggable: makeDraggable,
        getCurrenConfiguration: getCurrenConfiguration,
        loadCurrentConfiguration: loadCurrentConfiguration,
        reset: reset
    };
}();