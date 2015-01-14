'use strict'

app.controller 'SearchCtrl', ($scope, $rootScope, $modal, $modalStack, $timeout, $q, $log, Results) ->
# TODO: rows with ng-repeat
# http://angularjs4u.com/filters/angularjs-template-divs-row/

  $scope.results = 'scripts/components/results/resultsView.html'

  $scope.filterData = []
  $scope.canSearch = false

  # Coloca o total do carrinho numa variável global
  if typeof $rootScope.cartTotal != 'undefined'
    $rootScope.cartTotal
  else
    $rootScope.cartTotal = 0

  $scope.cartResults = []
  handleCartResults = (data, status) ->
    if status == 200
      $scope.cartResults = data
    else
      $scope.cartResults = 'Erro ao retornar os dados'

  Results.cart().success(handleCartResults)

  $scope.goCart = ->
    window.location.href='/bids'

  $scope.newSearch = (size) ->
    modalInstance = $modal.open(
      templateUrl: 'scripts/components/filter/filterView.html'
      # controller: 'SearchCtrl'
      controller: 'FilterCtrl'
      size: 'lg'
      backdrop: 'static'
      resolve:
        advertisers: ->
          $scope.advertisers
        categories: ->
          $scope.categories
        weekdays: ->
          $scope.weekdays
        determinations: ->
          $scope.determinations
        regions: ->
          $scope.regions
        makeFilter: ->
          $scope.makeFilter
        filterData: ->
          $scope.filterData
    )
    # modalInstance.result.then ((selectedItem) ->
    #   $scope.filterData = selectedItem
    #   return
    # ), ->
    #   $log.info "Modal dismissed at: " + new Date()
    #   return

  # $scope.newSearch = ->
  #   $scope.showModal = true

  $scope.makeFilter = ->
    $scope.filterData = []
    angular.forEach $scope.categories, (value, key) ->
      if value.ticked
        value['category_id[]'] = value.id
        $scope.filterData.push(value)
    angular.forEach $scope.weekdays, (value, key) ->
      if value.ticked
        value['week_day_id[]'] = value.id
        $scope.filterData.push(value)
    angular.forEach $scope.determinations, (value, key) ->
      if value.ticked
        value['determination_id[]'] = value.id
        $scope.filterData.push(value)
    angular.forEach $scope.regions, (value, key) ->
      if value.ticked
        value['state_id[]'] = value.id
        $scope.filterData.push(value)

    sendFilter($scope.filterData)


  sendFilter = (data) ->
    Results.sendFilter(data).success((data) ->
      console.log data
    )
    # sendingArray = []
    # angular.forEach data, (value, key) ->
    #   sendingArray.push(value)
    # console.log sendingArray
    # console.log data.['category_id[]']

  $scope.willOpenAdvertiserModal = {}
  # Modal para confirmação de mudança de advertiser
  $scope.$watch 'selectedAdvertiser', (newValue, oldValue) ->
    if (newValue != $scope.willOpenAdvertiserModal) and (newValue != oldValue)
      # A model do advertiser selecionado
      confirmModal = $modal.open(
        templateUrl: 'scripts/shared/utils/modalConfirmView.html'
        controller: 'ModalCtrl'
        size: 'sm'
        backdrop: 'static'
        resolve:
          theId: ->
            $scope.selectedAdvertiser
          title: ->
            'Mudança de advertiser'
          message: ->
            'Ao alterar essa opção o conteúdo do seu carrinho será apagado.'
          labelOk: ->
            'Tudo bem!'
          labelCancel: ->
            'Cancelar'
      )
      confirmModal.result.then ((isConfirmed) ->
        if isConfirmed
          $scope.eraseCart()
        else
          $scope.selectedAdvertiser = oldValue
      )

  $scope.eraseCart = ->
    Results.empty().success((data) ->
      data
      $rootScope.cartTotal = 0
    )

  $scope.checkAdvertiser = ->
    $scope.willOpenAdvertiserModal = $scope.selectedAdvertiser

  # Abre o modal
  $scope.forceSearch = true if $scope.filterData.length == 0
  $scope.forceSearch = true if $scope.canSearch
  # $timeout (->
  #   # Somente se ele já não estiver aberto!!!
  #   if typeof $modalStack.getTop() == 'undefined'
  #     $scope.newSearch() if $scope.forceSearch
  #     return
  # ), 3000

  # Dados que deveriam vir do servidor (mock)
  $scope.listAllData = []
  # Results.list('/determination').success (data) -> $scope.determinations = data

  determination = Results.list('/determination')
  advertiser = Results.list('/advertiser')
  weekday = Results.list('/weekday')
  category = Results.list('/category')
  region = Results.list('/region')
  $q.all([
    advertiser
    category
    weekday
    determination
    region
  ]).then (data) ->
    $scope.listAllData = data
    $scope.advertisers = data[0].data
    $scope.categories = data[1].data
    $scope.weekdays = data[2].data
    $scope.determinations = data[3].data
    $scope.regions = data[4].data
    # You can search now
    $scope.canSearch = true

