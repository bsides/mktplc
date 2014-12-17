'use strict'

app.controller 'ResultsCtrl', ($scope, ResultService) ->
# rows with ng-repeat
# http://angularjs4u.com/filters/angularjs-template-divs-row/

  $scope.searchData = ResultService.query()
