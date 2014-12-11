app.controller 'SearchMenuCtrl', ($scope, $http, $log) ->

  # # Returns id: {id, name}
  # request = (url, whoReturns) ->
  #   $http.get(url)
  #   .success (data) ->
  #     whoReturns = data

  # $scope.newspappers = request '/direct/list/newspaper', $scope.newspappers

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

