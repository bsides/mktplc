'use strict'

app.controller 'SearchMenuCtrl', ($scope, $http, $log) ->

  # TODO: refatorar essa porcaria. Sério, isso é horrível

  # Returns id: {id, name}
  $http.get('/direct/list/newspaper')
    .success (data) ->
      $scope.newspappers = data

  $http.get('/direct/list/category')
    .success (data) ->
      $scope.categories = data

  $http.get('/direct/list/color')
    .success (data) ->
      $scope.weekdays = data

  $http.get('/direct/list/determination')
    .success (data) ->
      $scope.determinations = data

  $http.get('/direct/list/format')
    .success (data) ->
      $scope.formats = data

  $http.get('/direct/list/profile')
    .success (data) ->
      $scope.profiles = data

  $http.get('/direct/list/weekday')
    .success (data) ->
      $scope.weekdays = data

  $http.get('/direct/list/section')
    .success (data) ->
      $scope.sections = data

  $scope.regions = [
      name: 'Sao Paulo'
    ,
      name: 'Rio de Janeiro'
  ]
