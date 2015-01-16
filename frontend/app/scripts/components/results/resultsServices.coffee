'use strict'

app.factory 'Results', ($http) ->
  url =
    get: '/direct/item'
    add: '/cart/add/'
    remove: '/cart/delete/'
    cart: '/cart'
    search: '/direct/item'
    list: '/direct/list'
    empty: '/cart/empty'

  cartTotal: (price) ->
    price = price + price

  get: ->
    $http.get(url.get)

  add: (bid) ->
    # $http(
    #   method: 'POST'
    #   url: url.add
    #   data: bid
    # )
    $http.get(url.add + bid)

  delete: (bidId) ->
    # $http(
    #   method: 'POST'
    #   url: url.remove + bidId
    # )
    $http.get(url.remove + bidId)

  empty: ->
    $http.get(url.empty)

  cart: ->
    $http.get(url.cart)

  sendFilter: (theFilter) ->
    $http.get(url.search + '?' + theFilter)

  list: (theFilter) ->
    $http.get(url.list + theFilter)
