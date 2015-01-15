'use strict'

app.controller 'ResultsCtrl', ($scope, $rootScope, $http, $log, Results) ->
# rows with ng-repeat
# http://angularjs4u.com/filters/angularjs-template-divs-row/

  # Formatador de resultado
  $scope.formatResults = (counter) ->
    if counter > 1
      $scope.resultLabel = counter + ' resultados'
    else if counter == 1
      $scope.resultLabel = counter + ' resultado'
    else
      $scope.resultLabel = ''

  # Put results in local variable
  if typeof $rootScope.searchData is 'undefined'
    $scope.searchData = []
    $scope.countResults = 0
  else
    $scope.countResults = $rootScope.searchData.length
    $scope.searchData = $rootScope.searchData

  # Ordenação de resultado

  # Modo de Visualização
  # aceita "view-regular" ou "view-compact"
  $scope.viewMode = 'view-regular'

  # Ordenação começa de forma ascendente
  $scope.isOrderAsc = true
  $scope.toggleOrder = ->
    $scope.isOrderAsc = not $scope.isOrderAsc

  # Tooltip dinâmica de acordo com a ordenação
  $scope.orderTooltip = ->
    if $scope.isOrderAsc then 'Trocar para ordem decrescente' else 'Trocar para ordem crescente'


  # Ações do carrinho

  # Utilitários
  $scope.isAddedToCart = {}
  $scope.isAddingToCart = {}

  # Adicionados
  # $scope.addedToCart = ->
  #   $scope.cart =

  # Adicionar
  $scope.addToCart = (bid) ->
    # Ações ao adicionar:
    # 1 - Loading no botão, para preparar para a chamada ajax
    # 2 - envia dados para o carrinho
    # 3 - no sucesso, desabilita o botão de adicionar, adiciona ícone de "adicionado" e desliga loading
    # 4 - acrescenta quantidade e atualiza valor ao carrinho

    # adicionamos manualmente a quantidade 1 caso quantity não exista
    bid.quantity = 1 unless bid.quantity

    # 1 - Loading no botão, para preparar para a chamada ajax
    $scope.isAddingToCart[bid.id] = true

    # 2 - envia dados para o carrinho
    Results.add(bid).success((data) ->
      # 3 - no sucesso, desabilita o botão de adicionar, adiciona ícone de "adicionado" e desliga loading
      $scope.isAddedToCart[bid.id] = true
      $scope.isAddingToCart[bid.id] = false
      # 4 - acrescenta quantidade e atualiza valor ao carrinho
      $rootScope.cartTotal = parseFloat($rootScope.cartTotal) + parseFloat(bid.bid.value)
    ).error((data) ->
      # console.log data
    )

  # Remover
  $scope.removeFromCart = (bidId) ->
    Results.delete(bidId).success((data) ->
      data
    )

  # $scope.cart =
  #   add: (id) ->
  #     found = $filter('filter')($rootScope.searchData, {id: id}, true)
  #     if found.length
  #       console.log JSON.stringify(found[0])

  # $scope.testando = (item) ->
  #   console.log item


