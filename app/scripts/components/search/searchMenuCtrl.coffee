app.controller 'SearchMenuCtrl', ($scope, $http, $log) ->
  headers =
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, OPTIONS',
    # 'Content-Type': 'application/json',
    'Accept': 'application/json'
  url = '//api.marketplace.localhost:8888/v1/common/geolocation/state'

  $http(
    method: 'GET'
    headers: headers
    url: url
  ).success (result) ->
    $scope.states = result._embedded.geolocation_state
  .error (data, status, headers, config) ->
    $log.log 'data: ' + data
    $log.log 'status: ' + status
    $log.log 'headers: ' + headers
    $log.log config

  $scope.news = [
    name: 'Estadão',
    count: 11,
  ,
    name: 'Folha'
    count: 9
  ,
    name: 'O Globo'
    count: 5
  ,
    name: 'The New York Times'
    count: 1
  ]
  $scope.ageGroups = [
    name: 'Crianças (0-12)'
    count: 2
  ,
    name: 'Adolescentes (13-19)'
    count: 6
  ,
    name: 'Jovens (18-28)'
    count: 5
  ,
    name: 'Adultos (29-39)'
    count: 17
  ]
  $scope.regions = [
    name: 'São Paulo'
    count: 112
  ,
    name: 'Rio de Janeiro'
    count: 94
  ,
    name: 'Ceará'
    count: 29
  ,
    name: 'Minas Gerais'
    count: 19
  ]
  $scope.weekDays = [
    name: 'Segunda'
    count: 16
  ,
    name: 'Terça'
    count: 34
  ,
    name: 'Quarta'
    count: 22
  ,
    name: 'Quinta'
    count: 80
  ,
    name: 'Sexta'
    count: 72
  ,
    name: 'Sábado'
    count: 199
  ,
    name: 'Domingo'
    count: 298
  ]
