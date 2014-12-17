'use strict'

app.factory 'ResultService', ($resource) ->
  urlBase = '/direct/item'
  $resource(urlBase)
