'use strict'

app.controller 'CartCtrl', ($scope) ->

  $scope.cartTotal = 1000.00

  $scope.goSearch = ->
    window.location.href = "/search"
