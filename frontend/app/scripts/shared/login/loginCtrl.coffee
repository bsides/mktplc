'use strict'

app.controller 'LoginCtrl', ($scope) ->
  $scope.isForgotten = false
  $scope.isSendEmail = false

  $scope.resetPass = ->
    $scope.isForgotten = not $scope.isForgotten

  $scope.sendEmail = ->
    $scope.isSendEmail = true;
