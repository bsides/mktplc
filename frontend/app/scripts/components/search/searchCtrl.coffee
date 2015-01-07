'use strict'

app.controller 'SearchCtrl', ($scope) ->
# TODO: rows with ng-repeat
# http://angularjs4u.com/filters/angularjs-template-divs-row/

  $scope.results = 'scripts/components/results/resultsView.html'
  $scope.cartTotal = 1000.00

  $scope.resultData =
    count: 10

  $scope.advertisers =  [
                          { name:'Cdv', id:1 },
                          { name:'Vdv', id:2 },
                          { name:'Adv', id:3 }
                        ]

  $scope.categories =   [
                          { name:'Esportes', id:1 },
                          { name:'Classificados', id:2 },
                          { name:'Entretenimento', id:3 }
                        ]

  $scope.goCart = ->
    window.location.href="/bids"

  $scope.test = ->
    console.log('test')

  $scope.clearFilters = ->
    $("td.filters").empty()
