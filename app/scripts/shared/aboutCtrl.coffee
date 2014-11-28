'use strict'

###*
 # @ngdoc function
 # @name marketplaceApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the marketplaceApp
###
angular.module('marketplaceApp')
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
