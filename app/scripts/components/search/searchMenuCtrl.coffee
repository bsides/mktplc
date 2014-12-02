app.controller 'SearchMenuCtrl', ($scope, publishersService) ->
  # $scope.status =
  #   open: false

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

  dataService.getTest().success (data) ->
    $scope.data = data
  .error (error) ->
    $scope.status = 'Unable to load publisher data: ' + error.message

