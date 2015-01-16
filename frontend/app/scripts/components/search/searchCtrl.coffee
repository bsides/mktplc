###*
 # @ngdoc function
 # @name marketplaceApp.controller:SearchCtrl
 # @description
 # # SearchCtrl
 # Controller principal do marketplace.
 # Retorna buscas, refaz modais de busca, usa serviços de resultados e listagens
 # Em um refactor, imagino retirar do $rootScope e colocar em serviços
 # as variáveis usadas globalmente
###

'use strict'

app.controller 'SearchCtrl', ($scope, $rootScope, $modal, $modalStack, $timeout, $q, $log, Results) ->
# TODO: rows with ng-repeat
# http://angularjs4u.com/filters/angularjs-template-divs-row/

  $scope.results = 'scripts/components/results/resultsView.html'
  $scope.canSearch = false

  # Variáveis de dados globais (dados persistentes entre páginas)

  # Pega os dados de busca mesmo se o usuário mudar de página
  if typeof $rootScope.searchData is 'undefined'
    $scope.searchData = []
  else
    $scope.searchData = $rootScope.searchData

  # Pega os parâmetros de busca mesmo se o usuário mudar de página
  if typeof $rootScope.filterData is 'undefined'
    $scope.filterData = []
  else
    $scope.filterData = $rootScope.filterData

  # Coloca o total do carrinho numa variável global
  if typeof $rootScope.cartTotal != 'undefined'
    $rootScope.cartTotal
  else
    $rootScope.cartTotal = 0

  $scope.cartResults = []
  handleCartResults = (data, status) ->
    if status == 200
      $scope.cartResults = data
    else
      $scope.cartResults = 'Erro ao retornar os dados'

  Results.cart().success(handleCartResults)

  # Formatador de resultado
  $scope.formatResults = (counter) ->
    if counter > 1
      $scope.resultLabel = counter + ' resultados'
    else if counter == 1
      $scope.resultLabel = counter + ' resultado'
    else
      $scope.resultLabel = 'Sem resultados'


  $scope.goCart = ->
    window.location.href='/bids'

  $scope.newSearch = (size) ->
    modalInstance = $modal.open(
      templateUrl: 'scripts/components/filter/filterView.html'
      # controller: 'SearchCtrl'
      controller: 'FilterCtrl'
      size: 'lg'
      backdrop: 'static'
      resolve:
        advertisers: ->
          $scope.advertisers
        categories: ->
          $scope.categories
        weekdays: ->
          $scope.weekdays
        determinations: ->
          $scope.determinations
        regions: ->
          $scope.regions
        makeFilter: ->
          $scope.makeFilter
        superSearchString: ->
          $scope.superSearchString
    )

  $scope.makeFilter = ->
    $scope.superSearchString = ''
    $scope.filterData = []
    angular.forEach $scope.categories, (value, key) ->
      if value.ticked
        $scope.superSearchString += '&category_id[]=' + value.id
        $scope.filterData.push(value)
    angular.forEach $scope.weekdays, (value, key) ->
      if value.ticked
        $scope.superSearchString += '&week_day_id[]=' + value.id
        $scope.filterData.push(value)
    angular.forEach $scope.determinations, (value, key) ->
      if value.ticked
        $scope.superSearchString += '&determination_id[]=' + value.id
        $scope.filterData.push(value)
    angular.forEach $scope.regions, (value, key) ->
      if value.ticked
        $scope.superSearchString += '&state_id[]=' + value.id
        $scope.filterData.push(value)

    $rootScope.filterData = $scope.filterData
    sendFilter($scope.superSearchString)
    return

  sendFilter = (data) ->
    Results.sendFilter(data).success((data) ->
      $rootScope.searchData = data
      $scope.searchData = data
    )

  # Modal para confirmação de mudança de advertiser
  $scope.willOpenAdvertiserModal = {}
  $scope.$watch 'selectedAdvertiser', (newValue, oldValue) ->
    if (newValue != $scope.willOpenAdvertiserModal) and (newValue != oldValue)
      # A model do advertiser selecionado
      confirmModal = $modal.open(
        templateUrl: 'scripts/shared/utils/modalConfirmView.html'
        controller: 'ModalCtrl'
        size: 'sm'
        backdrop: 'static'
        resolve:
          theId: ->
            $scope.selectedAdvertiser
          title: ->
            'Mudança de advertiser'
          message: ->
            'Ao alterar essa opção o conteúdo do seu carrinho será apagado.'
          labelOk: ->
            'Tudo bem!'
          labelCancel: ->
            'Cancelar'
      )
      confirmModal.result.then ((isConfirmed) ->
        if isConfirmed
          $scope.eraseCart()
        else
          $scope.selectedAdvertiser = oldValue
      )

  # Apaga o conteúdo do carrinho
  $scope.eraseCart = ->
    Results.empty().success((data) ->
      data
      $rootScope.cartTotal = 0
    )

  # Fix para selectbox de advertiser
  $scope.checkAdvertiser = ->
    $scope.willOpenAdvertiserModal = $scope.selectedAdvertiser

  # Listagem de dados do servidor ou local
  # É local depois da primeira lida.
  # Considerei que dificilmente o usuário precisará da listagem mais de uma vez por acesso
  if typeof $rootScope.listingAllData is 'undefined'
    determination = Results.list('/determination')
    advertiser = Results.list('/advertiser')
    weekday = Results.list('/weekday')
    category = Results.list('/category')
    region = Results.list('/region')
    $q.all([
      advertiser
      category
      weekday
      determination
      region
    ]).then (data) ->
      $rootScope.listingAllData = data
      $scope.advertisers = data[0].data
      $scope.categories = data[1].data
      $scope.weekdays = data[2].data
      $scope.determinations = data[3].data
      $scope.regions = data[4].data
      # You can search now
      $scope.canSearch = true
  else
    $scope.advertisers = $rootScope.listingAllData[0].data
    $scope.categories = $rootScope.listingAllData[1].data
    $scope.weekdays = $rootScope.listingAllData[2].data
    $scope.determinations = $rootScope.listingAllData[3].data
    $scope.regions = $rootScope.listingAllData[4].data
    $scope.canSearch = true

  # Abre o modal em first load
  $scope.forceSearch = true if $scope.canSearch
  $timeout (->
    # Somente se ele já não estiver aberto!!!
    if typeof $modalStack.getTop() == 'undefined'
      if $scope.canSearch
        $scope.newSearch()
      return
  ), 3000

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
  # Verifica se já foi adicionado
  if typeof $rootScope.isAddedToCart is 'undefined'
    $scope.isAddedToCart = {}
    $rootScope.isAddedToCart = {}
  else
    $scope.isAddedToCart = $rootScope.isAddedToCart

  $scope.isAddingToCart = {}

  # Adicionar
  $scope.addToCart = (item, index) ->
    newItem = {}
    # Ações ao adicionar:
    # 1 - Loading no botão, para preparar para a chamada ajax
    # 2 - envia dados para o carrinho
    # 3 - no sucesso, desabilita o botão de adicionar, adiciona ícone de "adicionado" e desliga loading
    # 4 - acrescenta quantidade e atualiza valor ao carrinho

    # adicionamos manualmente a quantidade 1 caso quantity não exista
    if item.quantity
      newItem.quantity = item.quantity
    else
      newItem.quantity = 1

    # 1 - Loading no botão, para preparar para a chamada ajax
    $scope.isAddingToCart[index] = true

    # Prepara item para envio
    newItem.comment = ''
    newItem.price = item.bid.value
    newItem.ads = []
    newItem.ads[0] =
      comment: ''
      date: ''
      price: item.bid.value

    newItem.features = item

    # 2 - envia dados para o carrinho
    Results.add(newItem).success((data) ->
      # 3 - no sucesso, desabilita o botão de adicionar, adiciona ícone de "adicionado" e desliga loading
      $rootScope.isAddedToCart[index] = true
      $scope.isAddedToCart[index] = true
      $scope.isAddingToCart[index] = false
      # 4 - acrescenta quantidade e atualiza valor ao carrinho
      $rootScope.cartTotal = parseFloat($rootScope.cartTotal) + parseFloat(newItem.price)
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
  #     found = $filter('filter')($scope.searchData, {id: id}, true)
  #     if found.length
  #       console.log JSON.stringify(found[0])

  # $scope.testando = (item) ->
  #   console.log item


