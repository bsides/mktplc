'use strict'

###*
 # @ngdoc overview
 # @name marketplaceApp
 # @description
 # # marketplaceApp
 #
 # Navigation Controller
###
app.controller 'NavCtrl', ($scope, $location, searchService) ->

  $scope.isActive = (viewLocation) ->
    $location.path() == viewLocation

  $scope.$on 'handleBroadcast', ->
    $scope.cart.totalPrice = $scope.cart.totalPrice + searchService.totalPrice

  $scope.cart = if searchService then searchService else 0

  return
