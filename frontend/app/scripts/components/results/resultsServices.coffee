'use strict'

app.factory 'Results', ($resource, $http) ->
  urlBase = '/direct/item'
  #$resource(urlBase)

  get: ->
    $http.get(urlBase)
