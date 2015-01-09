'use strict'

app.controller 'BidsCtrl', ($scope, $rootScope, Results) ->

  # Coloca o total do carrinho numa variável global
  if typeof $rootScope.cartTotal != 'undefined'
    $scope.cartTotal = $rootScope.cartTotal
  else
    $rootScope.cartTotal = 0
    $scope.cartTotal = $rootScope.cartTotal

  # Carrega os resultados ou retorna erro caso não der
  handleAllResults = (data, status) ->
    if status == 200
      $scope.getCartData = data
    else
      $scope.getCartData = 'Erro ao retornar os dados'

  # Link para search
  $scope.goSearch = ->
    window.location.href = "/search"

  # Try to get results
  $scope.getCartData = []

  # Deal with them
  Results.cart().success(handleAllResults)
