'use strict'

app.factory 'Results', ($resource, $http, $q) ->
  url =
    get: '/direct/item'
    add: '/cart/add'
    remove: '/cart/delete/'
    cart: '/cart'
    filter: '/direct/item'
    list: '/direct/list'

  cartTotal: (price) ->
    price = price + price

  get: ->
    $http.get(url.get)

  add: (bid) ->
    $http(
      method: 'POST'
      url: url.add
      data: bid
    )

  delete: (bidId) ->
    $http(
      method: 'POST'
      url: url.remove + bidId
    )

  cart: ->
    $http.get(url.cart)

  sendFilter: (filter) ->
    $http(
      method: 'POST'
      url: url.filter
      data: filter
    )

  list: (filter) ->
    $http.get(url.list + filter)
