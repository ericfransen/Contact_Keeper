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

