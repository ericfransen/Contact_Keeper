angular.module('ContactResource', ['ngResource']).factory('Contact', [
  '$resource',

  ($resource) ->
    $resource("/contacts/:id", { id: "@id" }, 
      {
        'index':   {method: 'GET',  isArray: true}
        'save':    {method: 'POST', isArray: false }
        'update':  {method: 'PUT' }
        #'show':    {method: 'GET', isArray: false }
        'destroy': {method: 'DELETE',  isArray: false }
      }
    )
])

angular.module('app.contactsApp', ['ContactResource']).controller("ContactsCtrl", [
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
