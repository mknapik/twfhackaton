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

    var PlacecholderModel = [];

    var markActivePlacecholder = function (index) {

        for (var i in placecholdersReferences) {
            if (placecholdersReferences.hasOwnProperty(i)) {
                if (i === index) {
                    placecholdersReferences[i].setAttribute("class", placecholdersReferences[i].getAttribute("class").replace("active", "") + " active");
                } else {
                    placecholdersReferences[i].setAttribute("class", placecholdersReferences[i].getAttribute("class").replace("active", ""));
                }
            }
        }
    };

    var getCurrenConfiguration = function () {
        var result = [];
        for(var i in PlacecholderModel){
            if(PlacecholderModel.hasOwnProperty(1) && PlacecholderModel[i].elementIside){
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
                            x: placecholderCordinates.left - draggedElementStartPosition.x,
                            y: placecholderCordinates.bottom - draggedElementStartPosition.y
                        };
                    }
                }
            }

        }
        if (result) {
            markActivePlacecholder(result.index);
        } else {
            markActivePlacecholder(false);
        }

        return result;

    }


    var makeDraggable = function () {

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
                    delete PlacecholderModel[isAdded.index].id;

                }
            },
            onDragEnd: function (a, b) {

                var currentPlacecholder = elenemtIsOnPlaceholder(this.target);
                if (currentPlacecholder) {
                    PlacecholderModel[currentPlacecholder.index].elementIside = true;
                    PlacecholderModel[currentPlacecholder.index].id = this.target.getAttribute("data-id");
                } else {
                    TweenLite.to(this.target, 0.5, {
                        x: 1,
                        y: 1,
                        delay: 0.1
                    });
                }
            },
            snap: {
                x: function (endValue) {
                    elenemtIsOnPlaceholder(this.target);
                    return elenemtIsOnPlaceholder(this.target) ? elenemtIsOnPlaceholder(this.target).x : endValue; //Math.round(endValue / 100) * 100;
                },
                y: function (endValue) {
                    return elenemtIsOnPlaceholder(this.target) ? elenemtIsOnPlaceholder(this.target).y : endValue;
                }
            }
        });
    };
    return {
        makeDraggable: makeDraggable,
        getCurrenConfiguration: getCurrenConfiguration
    };
}();