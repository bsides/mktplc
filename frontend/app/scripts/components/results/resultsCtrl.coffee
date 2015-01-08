'use strict'

app.controller 'ResultsCtrl', ($scope, $filter, $http, Results) ->
# rows with ng-repeat
# http://angularjs4u.com/filters/angularjs-template-divs-row/

  # Try to get results
  $scope.searchData = []

  handleAllResults = (data, status) ->
    if status == 200
      $scope.searchData = data
    else
      $scope.searchData = 'Erro ao retornar os dados'

  # Deal with them
  Results.get().success(handleAllResults)

  # Counter
  $scope.countResults = $scope.searchData.length

  # Formatador de resultado
  $scope.formatResults = (counter) ->
    if counter > 1
      $scope.resultLabel = counter + ' resultados'
    else if counter == 1
      $scope.resultLabel = counter + ' resultado'
    else
      $scope.resultLabel = 'Sua busca não retornou resultados'

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
  # Adicionados
  # $scope.addedToCart = ->
  #   $scope.cart =
  # Adicionar
  $scope.addToCart = (bid) ->
    # adicionamos manualmente a quantidade 1 caso quantity não exista
    bid.quantity = 1 unless bid.quantity
    # req =
    #   method: 'POST'
    #   url: '/cart/add'
    #   data: bid

    # $http(req).success(->
    #   'Adicionado com sucesso'
    # ).error (->
    #   'Houve um erro ao adicionar'
    # )
    Results.add(bid).success((data) ->
      data
    ).error((data) ->
      data
    )

  # Remover
  $scope.removeFromCart = (bidId) ->
    Results.delete(bidId).success((data) ->
      data
    )

  # $scope.cart =
  #   add: (id) ->
  #     found = $filter('filter')($scope.searchData, {id: id}, true)
  #     if found.length
  #       console.log JSON.stringify(found[0])

  # $scope.testando = (item) ->
  #   console.log item
