'use strict'

###*
 # @ngdoc overview
 # @name marketplaceApp
 # @description
 # # marketplaceApp
 #
 # Navigation Controller
###
app.controller 'NavCtrl', ($scope, $location) ->

  $scope.isActive = (viewLocation) ->
    $location.path() == viewLocation

  return
