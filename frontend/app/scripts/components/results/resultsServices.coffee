'use strict'

app.factory 'Results', ($resource, $http) ->
  url =
    get: '/direct/item'
    add: '/cart/add'
    remove: '/cart/delete/'

  #$resource(url.get)

  get: ->
    $http.get(url.get)

  add: (bid) ->
    console.log bid
    $http.get(
      method: 'POST'
      url: url.add
      data: bid
    )

  delete: ->
