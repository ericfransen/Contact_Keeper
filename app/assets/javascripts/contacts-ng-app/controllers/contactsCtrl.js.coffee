angular.module('app.contactsApp').controller("ContactsCtrl", [
  '$scope',
  '$http',

  ($scope, $http)->
    console.log 'ContactsCtrl running'

    $scope.contacts = []

    $http({ method: 'GET', url: '/contacts.json' }).success (data) ->
      $scope.contacts = data

    $scope.addContact = ->
      #$scope.contacts.push($scope.newContact)
      #$scope.newContact = {}
      console.log $scope.newContact

      data = $scope.newContact

      $http.post('contacts', data).then ->
        alert 'hi'



])
