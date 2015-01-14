'use strict'

app.factory 'Results', ($http) ->
  url =
    get: '/direct/item'
    add: '/cart/add'
    remove: '/cart/delete/'
    cart: '/cart'
    filter: '/direct/item'
    list: '/direct/list'
    empty: '/cart/empty'

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

  empty: ->
    $http.get(url.empty)

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
