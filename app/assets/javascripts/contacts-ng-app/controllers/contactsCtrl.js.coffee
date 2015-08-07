angular.module('app.contactsApp').controller("ContactsCtrl", [
  '$scope',
  ($scope)->
    console.log 'ContactsCtrl running'

    $scope.exampleValue = "Line checka one two one two"

])
