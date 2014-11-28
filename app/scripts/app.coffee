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
