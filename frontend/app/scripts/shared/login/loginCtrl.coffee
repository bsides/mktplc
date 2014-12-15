'use strict'

app.controller 'LoginCtrl', ($scope) ->
  $scope.isForgotten = false
  $scope.isSendEmail = false
  $scope.isNewPass = false
  console.log 'vai'

  $scope.resetPass = ->
    $scope.isForgotten = not $scope.isForgotten
    $scope.isSendEmail = false

  $scope.sendEmail = ->
    # backend
    $scope.isSendEmail = true

  $scope.autenticate = ->
