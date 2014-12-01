'use strict'

app.controller 'SearchCtrl', ($scope, searchService) ->
  console.log searchService

  $scope.addToCart = (price) ->
    # console.log searchService
    searchService.prepareForBroadcast price

  $scope.$on 'handleBroadcast', ->
    console.log 'cheguei nesse evento: ' + searchService.totalPrice
    $scope.price = searchService.totalPrice
