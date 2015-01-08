'use strict'

app.controller 'SearchCtrl', ($scope, $rootScope, $modal, Results) ->
# TODO: rows with ng-repeat
# http://angularjs4u.com/filters/angularjs-template-divs-row/

  $scope.results = 'scripts/components/results/resultsView.html'
  # $scope.filter = 'scripts/components/filter/filterView.html'
  if typeof $rootScope.cartTotal != 'undefined'
    $scope.cartTotal = $rootScope.cartTotal
  else
    $rootScope.cartTotal = 0
    $scope.cartTotal = $rootScope.cartTotal

  $scope.resultData =
    count: 10

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
