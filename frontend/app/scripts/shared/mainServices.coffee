'use strict'

###*
 # @ngdoc function
 # @name marketplaceApp.service:MainService
 # @description
 # # MainService
 # Serviço mais global para garantir que o carrinho fique centralizado no app
###
app.factory 'MainService', ($http, $rootScope) ->
  urlBase = '/cart'
  @cart = {}
  @cart.getAll = ->
    $http.get(urlBase)
  @cart.delete = (id) ->
    $http.get(urlBase + '/delete/' + id)
  @cart.add = ->
    $http.get(urlBase + '/add')



  $rootScope.tcart = {}
  $http.get('/cart').success( (data)->
    $rootScope.tcart.getAll = data
  )
  $http.get('/cart/add').success( (data)->
    $rootScope.tcart.add = data
  )
  $http.get('/cart/delete/:1').success( (data)->
    $rootScope.tcart.delete = data
  )
