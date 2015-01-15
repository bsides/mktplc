'use strict'

app.controller 'SearchCtrl', ($scope, $rootScope, $modal, $modalStack, $timeout, $q, $log, Results) ->
# TODO: rows with ng-repeat
# http://angularjs4u.com/filters/angularjs-template-divs-row/

  $scope.results = 'scripts/components/results/resultsView.html'

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
        superSearchString: ->
          $scope.superSearchString
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
    $scope.superSearchString = ''
    angular.forEach $scope.categories, (value, key) ->
      if value.ticked
        $scope.superSearchString += '&category_id[]=' + value.id
    angular.forEach $scope.weekdays, (value, key) ->
      if value.ticked
        $scope.superSearchString += '&week_day_id[]=' + value.id
    angular.forEach $scope.determinations, (value, key) ->
      if value.ticked
        $scope.superSearchString += '&determination_id[]=' + value.id
    angular.forEach $scope.regions, (value, key) ->
      if value.ticked
        $scope.superSearchString += '&state_id[]=' + value.id
        # value['state_id[]'] = value.id
        # $scope.filterData.push(value)

    sendFilter($scope.superSearchString)

  sendFilter = (data) ->
    $log.info 'enviando: ' + data
    Results.sendFilter(data).success((data) ->
      $log.info 'enviado!'
    )

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

  # Apaga o conteúdo do carrinho
  $scope.eraseCart = ->
    Results.empty().success((data) ->
      data
      $rootScope.cartTotal = 0
    )

  # Fix para selectbox
  $scope.checkAdvertiser = ->
    $scope.willOpenAdvertiserModal = $scope.selectedAdvertiser

  # Abre o modal em first load
  $scope.forceSearch = true if $scope.canSearch
  $timeout (->
    # Somente se ele já não estiver aberto!!!
    if typeof $modalStack.getTop() == 'undefined'
      $scope.newSearch() if $scope.forceSearch
      return
  ), 3000

  # Listagem de dados do servidor
  if typeof $rootScope.listingAllData is 'undefined'
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
      $rootScope.listingAllData = data
      $scope.advertisers = data[0].data
      $scope.categories = data[1].data
      $scope.weekdays = data[2].data
      $scope.determinations = data[3].data
      $scope.regions = data[4].data
      # You can search now
      $scope.canSearch = true
  else
    $scope.advertisers = $rootScope.listingAllData[0].data
    $scope.categories = $rootScope.listingAllData[1].data
    $scope.weekdays = $rootScope.listingAllData[2].data
    $scope.determinations = $rootScope.listingAllData[3].data
    $scope.regions = $rootScope.listingAllData[4].data
    $scope.canSearch = true

