'use strict'

app.factory 'Results', ($resource, $http) ->
  url =
    get: '/direct/item'
    add: '/cart/add'
    remove: '/cart/delete/'
    cart: '/cart'

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
