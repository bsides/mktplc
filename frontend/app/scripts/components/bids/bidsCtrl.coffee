'use strict'

app.controller 'BidsCtrl', ($scope, $rootScope, Results) ->

  # Try to get results
  $scope.getCartData = []

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

  # Deal with them
  Results.cart().success(handleAllResults)

  $scope.range = (n) ->
    Array.apply(null, {length: n}).map(Number.call, Number)

  $scope.bidData = [
    {
      name: 'Folha de SP'
      items: [
        category: 'Destaques'
        determination: 'Capa'
        format: 'Página Inteira'
        color: 'Cromia'
        price: 12012.00
        weekdays: ['Seg', 'Ter', 'Dom']
        quantity: 1
      ]
    }
    {
      name: 'O Globo'
      items: [
        {
          category: 'Esportes'
          determination: 'Padrão'
          format: 'Meia página'
          color: 'Cromia'
          price: 11030.50
          weekdays: ['Qua']
          quantity: 1
        }
        {
          category: 'Finanças'
          determination: 'Padrão'
          format: 'Rodapé'
          color: 'Cromia'
          price: 1000.00
          weekdays: ['Sáb']
          quantity: 1
        }
        {
          category: 'Cultura'
          determination: 'Capa'
          format: 'Meia página'
          color: 'PB'
          price: 56000.53
          weekdays: ['Sáb', 'Dom']
          quantity: 1
        }
      ]
    }
    {
      name: 'Estadão'
      items: [
        {
          category: 'Esportes'
          determination: 'Padrão'
          format: 'Metade vertical'
          color: 'PB'
          price: 11030.50
          weekdays: ['Qua']
          quantity: 1
        }
        {
          category: 'Política'
          determination: 'Padrão'
          format: 'Página inteira'
          color: 'Cromia'
          price: 45000.50
          weekdays: ['Seg', 'Ter', 'Qua', 'Qui', 'Sex']
          quantity: 1
        }
      ]
    }

  ]
