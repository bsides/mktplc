'use strict'

app.controller 'ResultsCtrl', ($scope, ResultService) ->
# rows with ng-repeat
# http://angularjs4u.com/filters/angularjs-template-divs-row/

  $scope.searchData = ResultService.query()
  $scope.countResults = $scope.searchData.length

  $scope.formatResults = (counter) ->
    if counter > 1
      $scope.resultLabel = counter + ' resultados'
    else if counter == 1
      $scope.resultLabel = counter + ' resultado'
    else
      $scope.resultLabel = 'Sua busca não retornou resultados'

  # Ordenação de resultado

  # Modo de Visualização
  # aceita "view-regular" ou "view-compact"
  $scope.viewMode = 'view-regular'
