angular.module('app.contactsApp').controller("ContactsCtrl", [
  '$scope',
  'Contact',

  ($scope, Contact) ->
    $scope.contacts = []
    $scope.contacts = Contact.index()

    $scope.addContact = ->
      contact = Contact.save($scope.newContact)
      $scope.contacts.push(contact)
      $scope.newContact = {}

    $scope.removeContact = (contact) ->
      cIndex = $scope.contacts.indexOf(contact)
      if cIndex > -1
        $scope.contacts.splice(cIndex, 1)
      contact = Contact.destroy(contact)

])

