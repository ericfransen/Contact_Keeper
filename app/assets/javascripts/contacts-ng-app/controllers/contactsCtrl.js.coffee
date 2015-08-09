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


    countryList = ['USA', 'Canada', 'Mexico']
    stateProvList = [
      [
        'Alabama'
        'Alaska'
        'Arizona'
        'Arkansas'
        'California'
        'Colorado'
        'Connecticut'
        'Delaware'
        'District Of Columbia'
        'Florida'
        'Georgia'
        'Hawaii'
        'Idaho'
        'Illinois'
        'Indiana'
        'Iowa'
        'Kansas'
        'Kentucky'
        'Louisiana'
        'Maine'
        'Maryland'
        'Massachusetts'
        'Michigan'
        'Minnesota'
        'Mississippi'
        'Missouri'
        'Montana'
        'Nebraska'
        'Nevada'
        'New Hampshire'
        'New Jersey'
        'New Mexico'
        'New York'
        'North Carolina'
        'North Dakota'
        'Ohio'
        'Oklahoma'
        'Oregon'
        'Pennsylvania'
        'Rhode Island'
        'South Carolina'
        'South Dakota'
        'Tennessee'
        'Texas'
        'Utah'
        'Vermont'
        'Virginia'
        'Washington'
        'West Virginia'
        'Wisconsin'
        'Wyoming'
      ]
      [ 
        'Alberta'
        'British Columbia'
        'Manitoba'
        'New Brunswick'
        'Newfoundland'
        'Northwest Territories'
        'Nova Scotia'
        'Nunavut'
        'Ontario'
        'Prince Edward Island'
        'Quebec'
        'Saskatchewan'
        'Yukoncan'
      ]
      [ 
        'Aguascalientes'
        'Baja California'
        'Baja California Sur'
        'Campeche'
        'Chiapas'
        'Chihuahua'
        'Coahuila'
        'Colima'
        'Distrito Federal'
        'Durango'
        'Guanajuato'
        'Guerrero'
        'Hidalgo'
        'Jalisco'
        'Michoacán'
        'Morelos'
        'México'
        'Nayarit'
        'Nuevo León'
        'Oaxaca'
        'Puebla'
        'Querétaro'
        'Quintana Roo'
        'San Luis Potosi'
        'Sinaloa'
        'Sonora'
        'Tabasco'
        'Tamaulipas'
        'Tlaxcala'
        'Veracruz'
        'Yucatán'
        'Zacatecas'
      ]
    ]

    $scope.countryOpts = countryList
    $scope.stePrvOpts  = stateProvList[0]
    $scope.getStePrvOpts = () ->
      key = $scope.countryOpts.indexOf($scope.newContact.country)
      newOptions = stateProvList[key]
      $scope.stePrvOpts = newOptions

])

