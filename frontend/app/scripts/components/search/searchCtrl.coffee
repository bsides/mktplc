'use strict'

app.controller 'SearchCtrl', ($scope, $rootScope, $modal, $log, Results) ->
# TODO: rows with ng-repeat
# http://angularjs4u.com/filters/angularjs-template-divs-row/

  $scope.results = 'scripts/components/results/resultsView.html'

  $scope.filterData = []
  $scope.showModal = false

  # Coloca o total do carrinho numa variável global
  if typeof $rootScope.cartTotal != 'undefined'
    $rootScope.cartTotal
  else
    $rootScope.cartTotal = 0

  $scope.resultData =
    count: 10

  $scope.goCart = ->
    window.location.href='/bids'

  $scope.formatResults = (counter) ->
    if counter > 1
      $scope.resultLabel = counter + ' resultados'
    else if results == 1
      $scope.resultLabel = counter + ' resultado'
    else
      $scope.resultLabel = 'Sua busca não retornou resultados'

  $scope.newSearch = (size) ->
    modalInstance = $modal.open(
      templateUrl: 'scripts/components/filter/filterView.html'
      # controller: 'SearchCtrl'
      controller: 'FilterCtrl'
      size: 'lg'
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
    angular.forEach $scope.categories, (value, key) ->
      consolidateFilterValues(value, key)
    angular.forEach $scope.weekdays, (value, key) ->
      consolidateFilterValues(value, key)

  consolidateFilterValues = (value, keys) ->
    $scope.filterData.push(value) if value.ticked


  # Dados que deveriam vir do servidor (mock)
  $scope.advertisers =  [
    {
      name: 'Cdv'
      id: 1
    }
    {
      name: 'Vdv'
      id: 2
    }
    {
      name: 'Adv'
      id: 3
    }
  ]

  $scope.categories = [
    {
      name: 'Esportes'
      id: 1
    }
    {
      name: 'Classificados'
      id: 2
    }
    {
      name: 'Entretenimento'
      id: 3
    }
  ]

  $scope.determinations = [
    {
      name: 'Meia Página'
      id: 1
    }
    {
      name: 'Muita Página'
      id: 2
    }
    {
      name: 'Página demais'
      id: 3
    }
  ]

  $scope.regions = [
    {
      name: 'Madagascar'
      id: 1
    }
    {
      name: 'São Paulo'
      id: 2
    }
    {
      name: 'Plutão'
      id: 3
    }
  ]

  $scope.weekdays = [
    {
      name: 'Segunda'
      id: 1
    }
    {
      name: 'Quarta'
      id: 2
    }
    {
      name: 'Quinta'
      id: 3
    }
  ]
