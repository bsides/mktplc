'use strict'

app.controller 'FilterCtrl', (
  $scope,
  $modalInstance,
  advertisers,
  categories,
  weekdays,
  determinations,
  regions,
  makeFilter
  ) ->
  $scope.advertisers = advertisers
  $scope.categories = categories
  $scope.weekdays = weekdays
  $scope.determinations = determinations
  $scope.regions = regions
  $scope.ok = ->
    makeFilter()
    $modalInstance.dismiss 'saiu'
    return
