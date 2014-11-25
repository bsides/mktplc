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
    'ngAnimate',
    'ngAria',
    'ngCookies',
    'ngMessages',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'scripts/shared/mainView.html'
        controller: 'MainController'
      .when '/search',
        templateUrl: 'scripts/components/search/searchView.html'
        controller: 'SearchController'
      .when '/purchases',
        templateUrl: 'scripts/components/purchases/purchasesView.html'
        controller: 'PurchasesController'
      .when '/bids',
        templateUrl: 'scripts/components/bids/bidsView.html'
        controller: 'BidsController'
      .when '/campaigns',
        templateUrl: 'scripts/components/campaigns/campaignsView.html'
        controller: 'CampaignsController'
      .otherwise
        redirectTo: '/'
