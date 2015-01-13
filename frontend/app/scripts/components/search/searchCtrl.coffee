'use strict'

app.controller 'SearchCtrl', ($scope, $rootScope, $modal, $modalStack, $timeout, $q, $log, Results) ->
# TODO: rows with ng-repeat
# http://angularjs4u.com/filters/angularjs-template-divs-row/

  $scope.results = 'scripts/components/results/resultsView.html'

  $scope.filterData = []
  $scope.canSearch = false

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
        filterData: ->
          $scope.filterData
    )
    # modalInstance.result.then ((selectedItem) ->
    #   $scope.filterData = selectedItem
    #   return
    # ), ->
    #   $log.info "Modal dismissed at: " + new Date()
    #   return

  # $scope.newSearch = ->
  #   $scope.showModal = true

  $scope.makeFilter = ->
    $scope.filterData = []
    angular.forEach $scope.categories, (value, key) ->
      value['category_id[]'] = value.id
      consolidateFilterValues(value, key)
    angular.forEach $scope.weekdays, (value, key) ->
      value['week_day_id[]'] = value.id
      consolidateFilterValues(value, key)
    angular.forEach $scope.determinations, (value, key) ->
      value['determination_id[]'] = value.id
      consolidateFilterValues(value, key)
    angular.forEach $scope.regions, (value, key) ->
      value['state_id[]'] = value.id
      consolidateFilterValues(value, key)
    sendFilter($scope.filterData)

  consolidateFilterValues = (value, keys) ->
    $scope.filterData.push(value) if value.ticked

  sendFilter = (data) ->
    Results.sendFilter(data).success(-> data)
    return
    # sendingArray = []
    # angular.forEach data, (value, key) ->
    #   sendingArray.push(value)
    # console.log sendingArray
    # console.log data.['category_id[]']


  # Abre o modal
  $scope.forceSearch = true if $scope.filterData.length == 0
  $scope.forceSearch = true if $scope.canSearch
  $timeout (->
    # Somente se ele já não estiver aberto!!!
    if typeof $modalStack.getTop() == 'undefined'
      $scope.newSearch() if $scope.forceSearch
      return
  ), 3000

  # Dados que deveriam vir do servidor (mock)
  $scope.listAllData = []
  # Results.list('/determination').success (data) -> $scope.determinations = data

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
    console.log data
    $scope.listAllData = data
    $scope.advertisers = data[0].data
    $scope.categories = data[1].data
    $scope.weekdays = data[2].data
    $scope.determinations = data[3].data
    $scope.regions = data[4].data
    # You can search now
    $scope.canSearch = true

  # $scope.advertisers =  [
  #   {
  #     name: 'Cdv'
  #     id: 1
  #   }
  #   {
  #     name: 'Vdv'
  #     id: 2
  #   }
  #   {
  #     name: 'Adv'
  #     id: 3
  #   }
  # ]

  # $scope.categories = [
  #   {
  #     name: 'Esportes'
  #     id: 1
  #   }
  #   {
  #     name: 'Classificados'
  #     id: 2
  #   }
  #   {
  #     name: 'Entretenimento'
  #     id: 3
  #   }
  # ]

  # # $scope.determinations = [
  # #   {
  # #     name: 'Meia Página'
  # #     id: 1
  # #   }
  # #   {
  # #     name: 'Muita Página'
  # #     id: 2
  # #   }
  # #   {
  # #     name: 'Página demais'
  # #     id: 3
  # #   }
  # # ]

  # $scope.regions = [
  #   {
  #     name: 'Madagascar'
  #     id: 1
  #   }
  #   {
  #     name: 'São Paulo'
  #     id: 2
  #   }
  #   {
  #     name: 'Plutão'
  #     id: 3
  #   }
  # ]

  # $scope.weekdays = [
  #   {
  #     name: 'Segunda'
  #     id: 1
  #   }
  #   {
  #     name: 'Quarta'
  #     id: 2
  #   }
  #   {
  #     name: 'Quinta'
  #     id: 3
  #   }
  # ]
