'use strict'

app.controller 'SearchCtrl', ($scope, $rootScope) ->
# TODO: rows with ng-repeat
# http://angularjs4u.com/filters/angularjs-template-divs-row/

  $scope.results = 'scripts/components/results/resultsView.html'
  $scope.cart = $rootScope.tcart
  # angular.forEach $scope.cart.getAll, ((value) ->
  #   $scope.cartTotal = 100
  # )

  $scope.resultData =
    count: 10

  $scope.formatResults = (counter) ->
    if counter > 1
      $scope.resultLabel = counter + ' resultados'
    else if results == 1
      $scope.resultLabel = counter + ' resultado'
    else
      $scope.resultLabel = 'Sua busca não retornou resultados'

  $scope.goCart = ->
    window.location.href="/bids"
