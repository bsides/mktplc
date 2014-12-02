angular.module('marketplace.templates', []).run(['$templateCache', function($templateCache) {
  $templateCache.put("scripts/components/bids/bidsView.html",
    "<div class=container><div class=row><div class=col-md-12>Propostas entrarão nesse espaço</div></div></div>");
  $templateCache.put("scripts/components/campaigns/campaignsView.html",
    "<div class=container><div class=row><div class=col-md-12>As campanhas serão mostradas aqui</div></div></div>");
  $templateCache.put("scripts/components/purchases/purchasesView.html",
    "<div class=container><div class=row><div class=col-md-12>Suas últimas compras</div></div></div>");
  $templateCache.put("scripts/components/search/searchMenuView.html",
    "<div ng-controller=SearchMenuCtrl><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Jornais <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in news\">{{item.name}} <span class=\"badge pull-right\">{{item.count}}</span></a></div></accordion-group></accordion><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Faixa Etária <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in ageGroups\">{{item.name}} <span class=\"badge pull-right\">{{item.count}}</span></a></div></accordion-group></accordion><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Área de Atuação <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in regions\">{{item.name}} <span class=\"badge pull-right\">{{item.count}}</span></a></div></accordion-group></accordion><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Dias da Semana <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in weekDays\">{{item.name}} <span class=\"badge pull-right\">{{item.count}}</span></a></div></accordion-group></accordion></div>");
  $templateCache.put("scripts/components/search/searchView.html",
    "<div class=\"container search-results\"><div class=row><div class=col-md-3><search-menu></search-menu></div><div class=col-md-9><div class=section><form action=\"\"><div class=input-group><label for=search class=sr-only>Busca</label><input id=search name=search class=\"form-control input-lg\" placeholder=\"Digite a região, área de atuação ou qualquer termo e busque!\"> <span class=input-group-btn><button class=\"btn btn-primary input-lg\" type=button>Buscar</button></span></div></form></div><div class=\"section row\"><div class=col-md-6><div class=\"panel panel-default\"><div class=panel-body><div class=media><a href=# class=media-left><img src=http://placehold.it/130x100 alt=\"\"></a><div class=media-body><h4 class=media-heading>Estadão</h4>Caderno: Esportes<br>Formato: Meia Página<br>Dias da Semana: Domingos<br>Cor: Cromia</div></div></div><div class=panel-footer>R$ <span class=price>5.000,00</span> <button type=button class=\"btn btn-primary\" ng-click=addToCart(5000)>Adicionar</button></div></div></div><div class=col-md-6><div class=\"panel panel-default\"><div class=panel-body><div class=media><a href=# class=media-left><img src=http://placehold.it/130x100 alt=\"\"></a><div class=media-body><h4 class=media-heading>O Globo</h4><span class=\"label label-default\">Caderno</span> Brasil<br><span class=\"label label-default\">Formato</span> Rodapé Alto<br><span class=\"label label-default\">Dia</span> Segundas<br><span class=\"label label-default\">Cor</span> PB</div></div></div><div class=panel-footer>R$ <span class=price>5.000,00</span> <button type=button class=\"btn btn-primary\">Adicionar</button></div></div></div></div><div class=\"section row\"><div class=col-md-6><div class=\"panel panel-default\"><div class=panel-body><div class=media><a href=# class=media-left><img src=http://placehold.it/130x100 alt=\"\"></a><div class=media-body><h4 class=media-heading>Folha de São Paulo</h4><span class=\"label label-default\">Caderno</span> Ilustrada<br><span class=\"label label-default\">Formato</span> Meia Página<br><span class=\"label label-default\">Dia</span> Domingos<br><span class=\"label label-default\">Cor</span> Cromia</div></div></div><div class=panel-footer>R$ <span class=price>5.000,00</span> <button type=button class=\"btn btn-primary\">Adicionar</button></div></div></div><div class=col-md-6><div class=\"panel panel-default\"><div class=panel-body><div class=media><a href=# class=media-left><img src=http://placehold.it/130x100 alt=\"\"></a><div class=media-body><h4 class=media-heading>Extra</h4>Caderno: Política<br>Formato: Anúncio 3 x 12,7<br>Dias da Semana: Terças<br>Cor: Cromia</div></div></div><div class=panel-footer>R$ <span class=price>5.000,00</span> <button type=button class=\"btn btn-primary\">Adicionar</button></div></div></div></div></div></div></div>");
  $templateCache.put("scripts/shared/aboutView.html",
    "<p>This is the about view.</p>");
  $templateCache.put("scripts/shared/footer/footerView.html",
    "<div class=container><span class=\"ficon ficon-heart\"></span> Predicta &amp; Direct &copy; 2014</div>");
  $templateCache.put("scripts/shared/header/headerView.html",
    "<div class=container><div class=row><div class=col-md-12><h3>Marketplace</h3></div></div></div>");
  $templateCache.put("scripts/shared/mainView.html",
    "<div class=container><div class=jumbotron><h1>'Allo, 'Allo!</h1><p class=lead><img src=images/yeoman.png alt=\"I'm Yeoman\"><br>Always a pleasure scaffolding your apps.</p><p><a class=\"btn btn-lg btn-success\" ng-href=#>Splendid!<span class=\"glyphicon glyphicon-ok\"></span></a></p></div><div class=\"row marketing\"><h4>HTML5 Boilerplate</h4><p>HTML5 Boilerplate is a professional front-end template for building fast, robust, and adaptable web apps or sites.</p><h4>Angular</h4><p>AngularJS is a toolset for building the framework most suited to your application development.</p><h4>Karma</h4><p>Spectacular Test Runner for JavaScript.</p></div></div>");
  $templateCache.put("scripts/shared/nav/navView.html",
    "<nav class=\"navbar navbar-default\" role=navigation><div class=container><div class=navbar-header><button type=button class=\"navbar-toggle collapsed\" data-toggle=collapse data-target=#navbar aria-expanded=false aria-controls=navbar><span class=sr-only>Toggle navigation</span> <span class=icon-bar></span> <span class=icon-bar></span> <span class=icon-bar></span></button></div><div ng-controller=NavCtrl class=\"collapse navbar-collapse\" id=navbar><ul class=\"nav navbar-nav\"><li ng-class=\"{ active:isActive('/search') }\"><a href=#/search>Busca</a></li><li ng-class=\"{ active:isActive('/purchases') }\"><a href=#/purchases>Últimas compras</a></li><li ng-class=\"{ active:isActive('/bids')}\"><a href=#/bids>Propostas</a></li><li ng-class=\"{ active:isActive('/campaigns') }\"><a href=#/campaigns>Campanhas</a></li></ul><form action=\"\" class=\"navbar-form navbar-right\"><button type=button class=\"btn btn-default\"><i class=\"ficon ficon-basket\"></i> <span class=badge>1</span> <span class=price-label>Valor total</span> <span class=price-value>R$ {{ cart.totalPrice | currency }}</span></button></form></div></div></nav>");
}]);
