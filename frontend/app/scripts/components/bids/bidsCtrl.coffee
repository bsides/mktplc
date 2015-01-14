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

  # Comments
  $scope.isCommenting = {}
  $scope.toggleComment = (id) ->
    $scope.isCommenting[id] = not $scope.isCommenting[id]
  $scope.saveComment = (id) ->
    $scope.id

  # Date utilities
  $scope.today = ->
    $scope.theDate = new Date()
  $scope.today()

  $scope.clearDate = ->
    $scope.theDate = null

  $scope.disabledDates = (date, mode) ->
    mode is "day" and (date.getDay() is 0 or date.getDay() is 6)

  $scope.toggleMinDate = ->
    $scope.minDate = (if $scope.minDate then null else new Date())
  $scope.toggleMinDate()

  $scope.openDate = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()
    $scope.dateOpened = true

  $scope.dateOptions =
    formatYear: 'yy'
    startingDay: 1

  $scope.dateFormats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate']
  $scope.dateFormat = $scope.dateFormats[0]

  # Transform into array for ng-repeat
  $scope.range = (n) ->
    Array.apply(null, {length: n}).map(Number.call, Number)

  # Remove this bid
  $scope.removeBid = (id) ->
    Results.delete(id).success((data) -> console.log data)

  $rootScope.removeBid = $scope.removeBid

  # Data coming from server
  $scope.bidData = [
    {
      id: 231
      name: 'Folha de SP'
      comment: ''
      items: [
        id: 7
        category: 'Destaques'
        determination: 'Capa'
        format: 'Página Inteira'
        color: 'Cromia'
        price: 12012.00
        weekdays: ['Seg', 'Ter', 'Dom']
        quantity: 1
        comment: ''
      ]
    }
    {
      id: 32
      name: 'O Globo'
      comment: ''
      items: [
        {
          id: 438
          category: 'Esportes'
          determination: 'Padrão'
          format: 'Meia página'
          color: 'Cromia'
          price: 11030.50
          weekdays: ['Qua']
          quantity: 1
          comment: ''
        }
        {
          id: 43
          category: 'Finanças'
          determination: 'Padrão'
          format: 'Rodapé'
          color: 'Cromia'
          price: 1000.00
          weekdays: ['Sáb']
          quantity: 1
          comment: ''
        }
        {
          id: 4
          category: 'Cultura'
          determination: 'Capa'
          format: 'Meia página'
          color: 'PB'
          price: 56000.53
          weekdays: ['Sáb', 'Dom']
          quantity: 1
          comment: ''
        }
      ]
    }
    {
      id: 3213
      name: 'Estadão'
      comment: ''
      items: [
        {
          id: 9
          category: 'Esportes'
          determination: 'Padrão'
          format: 'Metade vertical'
          color: 'PB'
          price: 11030.50
          weekdays: ['Qua']
          quantity: 1
          comment: ''
        }
        {
          id: 10
          category: 'Política'
          determination: 'Padrão'
          format: 'Página inteira'
          color: 'Cromia'
          price: 45000.50
          weekdays: ['Seg', 'Ter', 'Qua', 'Qui', 'Sex']
          quantity: 1
          comment: ''
        }
      ]
    }
  ]
