'use strict'

app.factory 'cartService', ($scope) ->

app.factory 'publishersService', ($scope, $http) ->
  ref = 'http://10.0.200.192:8888/v1/newspaper/publisher'
  dataService = {}
  dataService.getTest = ->
    $http.jsonp ref + '/test?callback=listPublishers'

  dataService
