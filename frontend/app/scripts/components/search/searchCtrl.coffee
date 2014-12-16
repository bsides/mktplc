'use strict'

app.controller 'SearchCtrl', ($scope) ->
# TODO: rows with ng-repeat
# http://angularjs4u.com/filters/angularjs-template-divs-row/

  $scope.results = './scripts/components/results/resultsView.html'
  $scope.cartTotal = 1000.00

  $scope.resultData =
    count: 10

  $scope.formatResults = (counter) ->
    if counter > 1
      $scope.resultLabel = counter + ' resultados'
    else if results == 1
      $scope.resultLabel = counter + ' resultado'
    else
      $scope.resultLabel = 'Sua busca não retornou resultados'
