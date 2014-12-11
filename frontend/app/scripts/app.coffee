'use strict'

###*
 # @ngdoc overview
 # @name marketplaceApp
 # @description
 # # marketplaceApp
 #
 # Main module of the application.
###
root = exports ? this

root.app = angular
  .module('marketplaceApp', [
    'ui.bootstrap'
    'marketplace.templates'
    'ui-templates'
    'ngAnimate'
    'ngAria'
    'ngCookies'
    'ngMessages'
    'ngResource'
    'ngRoute'
    'ngSanitize'
    'ngTouch'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'scripts/shared/mainView.html'
        controller: 'MainCtrl'
      .when '/search',
        templateUrl: 'scripts/components/search/searchView.html'
        controller: 'SearchCtrl'
      .when '/results',
        templateUrl: 'scripts/components/results/resultsView.html'
        controller: 'ResultsCtrl'
      .when '/purchases',
        templateUrl: 'scripts/components/purchases/purchasesView.html'
        controller: 'PurchasesCtrl'
      .when '/bids',
        templateUrl: 'scripts/components/bids/bidsView.html'
        controller: 'BidsCtrl'
      .when '/campaigns',
        templateUrl: 'scripts/components/campaigns/campaignsView.html'
        controller: 'CampaignsCtrl'
      .otherwise
        redirectTo: '/'

  .config ($httpProvider) ->
    # We need to setup some parameters for http requests
    # These three lines are all you need for CORS support
    $httpProvider.defaults.useXDomain = true
    $httpProvider.defaults.withCredentials = true
    delete $httpProvider.defaults.headers.common['X-Requested-With']

  .config ($locationProvider) ->
    $locationProvider.html5Mode(true)
