'use strict'

app.controller 'SearchCtrl', ($scope) ->
# TODO: rows with ng-repeat
# http://angularjs4u.com/filters/angularjs-template-divs-row/

  $scope.results = './scripts/components/results/resultsView.html'
  $scope.cartTotal = 1000.00

  $scope.resultData =
    count: 10

  $scope.goCart = ->
    window.location.href="/bids"

