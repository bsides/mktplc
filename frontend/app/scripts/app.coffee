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
        redirectTo: '/search'
      .when '/home',
        redirectTo: '/search'
      .when 'ofertas',
        redirectTo: '/search'
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
      .when '/login',
        templateUrl: 'scripts/shared/login/loginView.html'
        controller: 'LoginCtrl'
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



###*
 # @ngdoc object
 # @name marketplace.app:helpers
 # @description
 # # helpers
 # Helpers of the marketplace
###
root.app.helpers =
  ###*
   # @ngdoc function
   # @name marketplace.app.helpers:output
   # @description
   # # helpers
   # Helpers of the marketplace
  ###
  output: (json, withSyntaxHighlight = true) ->
    if withSyntaxHighlight?
      json = JSON.stringify(json, 'undefined', 2)
    else
      return JSON.stringify(json, 'undefined', 2)

    json = json.replace(/&/g, '&').replace(/</g, '&lt;').replace(/>/g, '&gt;')
    result = json.replace /("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, (match) ->
      cls = 'number'
      if /^"/.test(match)
        if /:$/.test(match)
          cls = 'key'
        else
          cls = 'string'
      else if /true|false/.test(match)
        cls = 'boolean'
      else cls = 'null'  if /null/.test(match)
      '<span class="' + cls + '">' + match + '</span>'

    result
