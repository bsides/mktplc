'use strict'

app.controller 'BidsCtrl', ($scope, $rootScope, Results) ->

  if typeof $rootScope.cartTotal != 'undefined'
    $scope.cartTotal = $rootScope.cartTotal
  else
    $rootScope.cartTotal = 0
    $scope.cartTotal = $rootScope.cartTotal

  $scope.goSearch = ->
    window.location.href = "/search"

  # Try to get results
  $scope.getCartData = []

  handleAllResults = (data, status) ->
    if status == 200
      $scope.getCartData = data
    else
      $scope.getCartData = 'Erro ao retornar os dados'

  # Deal with them
  Results.cart().success(handleAllResults)

  console.log $scope.getCartData
