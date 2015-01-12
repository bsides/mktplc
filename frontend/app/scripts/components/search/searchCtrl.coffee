'use strict'

app.controller 'SearchCtrl', ($scope, $rootScope, $modal, Results) ->
# TODO: rows with ng-repeat
# http://angularjs4u.com/filters/angularjs-template-divs-row/

  $scope.results = 'scripts/components/results/resultsView.html'
  # $scope.filter = 'scripts/components/filter/filterView.html'

  # Coloca o total do carrinho numa variável global
  if typeof $rootScope.cartTotal != 'undefined'
    $rootScope.cartTotal
  else
    $rootScope.cartTotal = 0

  $scope.resultData =
    count: 10

  $scope.goCart = ->
    window.location.href='/bids'

  $scope.test = ->
    console.log('test')

  $scope.clearFilters = ->
    $('td.filters').empty()

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
      controller: 'SearchCtrl'
      size: 'lg'
      resolve:
        advertisers: ->
          $scope.advertisers
        categories: ->
          $scope.categories
        test: ->
          $scope.test
    )

  $scope.makeFilter = (item, model, label) ->


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

  $scope.categories =   [
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

