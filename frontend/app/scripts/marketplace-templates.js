angular.module('marketplace.templates', []).run(['$templateCache', function($templateCache) {
  $templateCache.put("scripts/components/bids/bidsView.html",
    "<div class=container><div class=row><div class=col-md-12>Propostas entrarão nesse espaço</div></div></div>");
  $templateCache.put("scripts/components/campaigns/campaignsView.html",
    "<div class=container><div class=row><div class=col-md-12>As campanhas serão mostradas aqui</div></div></div>");
  $templateCache.put("scripts/components/purchases/purchasesView.html",
    "<div class=container><div class=row><div class=col-md-12>Suas últimas compras</div></div></div>");
  $templateCache.put("scripts/components/results/resultsView.html",
    "<div class=\"container search-results\"><div class=row><div class=col-md-4><div class=\"panel panel-default\"><div class=panel-body><div class=media><a href=# class=media-left># weekday #</a><div class=media-body><h4 class=media-heading># Jornal #</h4># Formato: 1/2 Página #<br># Caderno: Esportes #<br><button type=button class=\"btn btn-default\">Ver regiões</button><br># Cor: Cromia #</div></div></div><div class=panel-footer># R$ <span class=price>5.000,00</span> # <button type=button class=\"btn btn-primary\" ng-click=addToCart(5000)>Adicionar</button></div></div></div><div class=col-md-4><div class=\"panel panel-default\"><div class=panel-body><div class=media><a href=# class=media-left><img src=http://placehold.it/130x100 alt=\"\"></a><div class=media-body><h4 class=media-heading>Estadão</h4>Caderno: Esportes<br>Formato: Meia Página<br>Dias da Semana: Domingos<br>Cor: Cromia</div></div></div><div class=panel-footer>R$ <span class=price>5.000,00</span> <button type=button class=\"btn btn-primary\" ng-click=addToCart(5000)>Adicionar</button></div></div></div><div class=col-md-4><div class=\"panel panel-default\"><div class=panel-body><div class=media><a href=# class=media-left><img src=http://placehold.it/130x100 alt=\"\"></a><div class=media-body><h4 class=media-heading>Estadão</h4>Caderno: Esportes<br>Formato: Meia Página<br>Dias da Semana: Domingos<br>Cor: Cromia</div></div></div><div class=panel-footer>R$ <span class=price>5.000,00</span> <button type=button class=\"btn btn-primary\" ng-click=addToCart(5000)>Adicionar</button></div></div></div></div><div class=row><div class=col-md-4><div class=\"panel panel-default\"><div class=panel-body><div class=media><a href=# class=media-left><img src=http://placehold.it/130x100 alt=\"\"></a><div class=media-body><h4 class=media-heading>Estadão</h4>Caderno: Esportes<br>Formato: Meia Página<br>Dias da Semana: Domingos<br>Cor: Cromia</div></div></div><div class=panel-footer>R$ <span class=price>5.000,00</span> <button type=button class=\"btn btn-primary\" ng-click=addToCart(5000)>Adicionar</button></div></div></div><div class=col-md-4><div class=\"panel panel-default\"><div class=panel-body><div class=media><a href=# class=media-left><img src=http://placehold.it/130x100 alt=\"\"></a><div class=media-body><h4 class=media-heading>Estadão</h4>Caderno: Esportes<br>Formato: Meia Página<br>Dias da Semana: Domingos<br>Cor: Cromia</div></div></div><div class=panel-footer>R$ <span class=price>5.000,00</span> <button type=button class=\"btn btn-primary\" ng-click=addToCart(5000)>Adicionar</button></div></div></div><div class=col-md-4><div class=\"panel panel-default\"><div class=panel-body><div class=media><a href=# class=media-left><img src=http://placehold.it/130x100 alt=\"\"></a><div class=media-body><h4 class=media-heading>Estadão</h4>Caderno: Esportes<br>Formato: Meia Página<br>Dias da Semana: Domingos<br>Cor: Cromia</div></div></div><div class=panel-footer>R$ <span class=price>5.000,00</span> <button type=button class=\"btn btn-primary\" ng-click=addToCart(5000)>Adicionar</button></div></div></div></div></div>");
  $templateCache.put("scripts/components/search/searchMenuView.html",
    "<div ng-controller=SearchMenuCtrl><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Jornais <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in newspappers\">{{item.name}} <span class=\"badge pull-right\">{{item.count}}</span></a></div></accordion-group></accordion><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Categorias <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in categories\">{{item.name}} <span class=\"badge pull-right\">{{item.count}}</span></a></div></accordion-group></accordion><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Dias da Semana <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in weekdays\">{{item.name}} <span class=\"badge pull-right\">{{item.count}}</span></a></div></accordion-group></accordion><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Determinações <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in determinations\">{{ item.name }} <span class=\"badge pull-right\">{{ item.count }}</span></a></div></accordion-group></accordion><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Formatos <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in formats\">{{ item.name }} <span class=\"badge pull-right\">{{ item.count }}</span></a></div></accordion-group></accordion><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Perfis <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in profiles\">{{ item.name }} <span class=\"badge pull-right\">{{ item.count }}</span></a></div></accordion-group></accordion><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Cadernos <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in sections\">{{ item.name }} <span class=\"badge pull-right\">{{ item.count }}</span></a></div></accordion-group></accordion></div>");
  $templateCache.put("scripts/components/search/searchView.html",
    "<div class=container><div class=row><div class=col-md-4><h2>Busca de Ofertas</h2></div><div class=col-md-4>Anunciante<select name=\"\" class=form-control><option value=\"\">Etecetera</option><option value=\"\">Anunciante tal</option><option value=\"\">Muito increvys</option></select></div><div class=col-md-4><form action=\"\" class=\"navbar-form navbar-right\"><button type=button class=\"btn btn-default\"><i class=\"ficon ficon-basket\"></i> <span class=badge>1</span> <span class=price-label>Valor total</span> <span class=price-value>R$ {{ cart.totalPrice | currency }}</span></button></form></div></div></div><div class=container><div class=row><div class=col-md-12><p>8 resultados</p><button class=\"btn btn-default pull-right\">fazer nova busca</button></div></div><div class=row><div class=col-md-12><div class=boxed><span class=\"label label-info\">jornal A</span> <span class=\"label label-info\">jornal B</span> <span class=\"label label-info\">1/2 pagina</span> <span class=\"label label-info\">todos os cadernos</span></div></div></div><div class=row><div class=col-md-9><div class=well><div class=row><div class=col-md-3>filtros</div><div class=col-md-3>preco<select name=\"\" class=form-control><option value=\"\">até R$ 1000</option><option value=\"\">R$ 2000</option><option value=\"\">R$ 3000</option></select></div><div class=col-md-3>dias da semana<select name=\"\" class=form-control><option value=\"\">Segunda</option><option value=\"\">Terça</option><option value=\"\">Dona Mingo</option></select></div><div class=col-md-3>cores<select name=\"\" class=form-control><option value=\"\">Cromia</option><option value=\"\">PB</option><option value=\"\">Rosa Nike XOKS</option></select></div></div></div></div><div class=col-md-2><p>ordenacao</p><select name=\"\" class=form-control><option value=\"\">Ascendente</option><option value=\"\">Por fases da lua</option><option value=\"\">Em marte</option></select></div><div class=col-md-2><p>views</p><button class=\"btn btn-default\"><i class=\"ficon ficon-layout\"></i></button> <button class=\"btn btn-default\"><i class=\"ficon ficon-menu\"></i></button> <span><i class=ficon></i></span></div></div></div><div ng-include=results></div>");
  $templateCache.put("scripts/shared/aboutView.html",
    "<p>This is the about view.</p>");
  $templateCache.put("scripts/shared/footer/footerView.html",
    "<div class=container><span class=\"ficon ficon-heart\"></span> Predicta &amp; Direct &copy; 2014</div>");
  $templateCache.put("scripts/shared/header/headerView.html",
    "<div class=container><div class=row><div class=col-md-12><h3>Marketplace</h3></div></div></div>");
  $templateCache.put("scripts/shared/login/loginView.html",
    "<div><div class=header><img src=../images/logo_market_place.png></div><div class=login><form><input placeholder=e-mail> <input type=password placeholder=senha> <button type=button class=\"btn btn-primary\" ng-click=\"\">Entrar</button></form><a href=/account/info>Esqueci a senha</a></div></div><div><div class=header><img src=../images/logo_market_place.png></div><div class=login><form class=reset-pass><h3>Esqueceu sua senha?</h3><div><p>Digite o endereço de e-mail usado para criar sua conta.</p><p>Vamos localizar suas informações e lhe enviar um e-mail com um link para redefinir sua senha.</p></div><fieldset><input placeholder=e-mail> <button type=button class=\"btn btn-primary\" ng-click=\"\">Enviar</button></fieldset></form></div></div><div><div class=header><img src=../images/logo_market_place.png></div><div class=login><form class=reset-pass><h3>Esqueceu sua senha?</h3><div><p>Confira seu e-mail! Enviamos um link para que você possa redefinir sua senha.</p><p>Este e-mail contém um link que o levará para uma página onde você pode criar uma nova senha.</p><p>Se você não receber este e-mail dentro de alguns minutos, verifique sua pasta de spam, ou envie um outro pedido.</p></div><fieldset><button type=button class=\"btn btn-info\" ng-click=\"\">enviar o email novamente</button> <button type=button class=\"btn btn-primary\" ng-click=\"\">login</button></fieldset></form></div></div><div><div class=header><img src=../images/logo_market_place.png></div><div class=login><form class=\"reset-pass new-pass\"><h3>Definir senha</h3><strong>Por favor defina uma nova senha</strong><div><p>Para que sua senha seja válida ela deve ter no mínimo:</p><p>8 caracteres - uma letra maíuscula - uma letra minúscula - um número.</p></div><table><tr><td>Senha</td><td>Confirme a senha</td></tr><tr><td><input type=password placeholder=senha></td><td><input type=password placeholder=senha></td></tr></table><fieldset><button type=button class=\"btn btn-info\" ng-click=\"\">cancelar</button> <button type=button class=\"btn btn-primary\" ng-click=\"\">salvar</button></fieldset></form></div></div>");
  $templateCache.put("scripts/shared/mainView.html",
    "<div class=container><div class=jumbotron><h1>'Allo, 'Allo!</h1><p class=lead><img src=images/yeoman.png alt=\"I'm Yeoman\"><br>Always a pleasure scaffolding your apps.</p><p><a class=\"btn btn-lg btn-success\" ng-href=#>Splendid!<span class=\"glyphicon glyphicon-ok\"></span></a></p></div><div class=\"row marketing\"><h4>HTML5 Boilerplate</h4><p>HTML5 Boilerplate is a professional front-end template for building fast, robust, and adaptable web apps or sites.</p><h4>Angular</h4><p>AngularJS is a toolset for building the framework most suited to your application development.</p><h4>Karma</h4><p>Spectacular Test Runner for JavaScript.</p></div></div>");
  $templateCache.put("scripts/shared/nav/navView.html",
    "<nav class=\"navbar navbar-default\" role=navigation><div class=container><div class=navbar-header><button type=button class=\"navbar-toggle collapsed\" data-toggle=collapse data-target=#navbar aria-expanded=false aria-controls=navbar><span class=sr-only>Toggle navigation</span> <span class=icon-bar></span> <span class=icon-bar></span> <span class=icon-bar></span></button></div><div ng-controller=NavCtrl class=\"collapse navbar-collapse\" id=navbar><ul class=\"nav navbar-nav\"><li ng-class=\"{ active:isActive('/search')||isActive('/results') }\"><a href=/search>Busca</a></li><li ng-class=\"{ active:isActive('/purchases') }\"><a href=/purchases>Últimas compras</a></li><li ng-class=\"{ active:isActive('/bids')}\"><a href=/bids>Propostas</a></li><li ng-class=\"{ active:isActive('/campaigns') }\"><a href=/campaigns>Campanhas</a></li></ul></div></div></nav>");
}]);