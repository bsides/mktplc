'use strict'

###*
 # @ngdoc overview
 # @name marketplaceApp
 # @description
 # # marketplaceApp
 #
 # Navigation Controller
###
app.controller 'NavController', ($scope, $location) ->

  $scope.isActive = (viewLocation) ->
    $location.path() == viewLocation

  return
