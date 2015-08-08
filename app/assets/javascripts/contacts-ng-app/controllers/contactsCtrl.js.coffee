angular.module('app.contactsApp').controller("ContactsCtrl", [
  '$scope',

  ($scope)->
    console.log 'ContactsCtrl running'

    $scope.contacts = [
      {
        firstName: 'Eric'
        lastName:  'Fransen'
        address: '123 Street'
        city: 'Denver'
        stateOrProvince: 'CO'
        country: 'USA'
        zip: 80211
        phone: '555-555-5555'
        email: 'eric@me.com'
      }
      {
        firstName: 'Batman'
      }
    ]

    $scope.addContact = ->
      $scope.contacts.push($scope.newContact)
      $scope.newContact = {}


])
