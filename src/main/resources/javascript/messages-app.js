var bookmarksWidget = angular.module('messagesWidgetApp', ['messagesServiceApp']);

bookmarksWidget.controller('messages-ctrl', ['$scope', 'messageServices', function($scope, messageServices) {
    $scope.$watch("channel", function (newValue, oldValue) {
        if(newValue) {
            $scope.refresh();
        }
    });

    $scope.refresh = function() {
        messageServices.getMessages($scope.channel, function(messages) {
            $scope.$apply(function () {
                $scope.messages = messages;
            });
        })
    };

    $scope.submit = function() {
        messageServices.postMessage($scope.channel, $scope.newMessage, function() {
            $scope.refresh();
        })
    };

    setInterval($scope.refresh, 1000);
}]);

bookmarksWidget.controller('messages-edit-ctrl', ['$scope', 'messageServices', function ($scope, messageServices) {
    $scope.update = function () {
        messageServices.updateWidget($scope.widget, $scope.channel);
    };

    $scope.cancel = function () {
        $scope.widget.load();
    };
}]);