angular.module('app.contactsApp').controller("ContactsCtrl", [
  '$scope',
  '$http',

  ($scope, $http)->
    console.log 'ContactsCtrl running'

    $scope.contacts = []

    #$scope.contacts = $http({ method: 'GET', url: '/contacts.json' })
    $http({ method: 'GET', url: '/contacts.json' }).success (data) ->
      $scope.contacts = data

    $scope.addContact = ->
      $scope.contacts.push($scope.newContact)
      $scope.newContact = {}


])
