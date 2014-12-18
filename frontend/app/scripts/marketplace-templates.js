angular.module('marketplace.templates', []).run(['$templateCache', function($templateCache) {
  $templateCache.put("scripts/components/bids/bidsView.html",
    "<div class=container><div class=row><div class=col-md-8><h2>Carrinho | Proposta</h2></div><div class=col-md-4><div class=cart-button><span class=cart-icon><i class=\"ficon ficon-basket\"></i></span> <span class=cart-quantity><span>1</span></span> <span class=cart-total><span class=price-label>R$</span> <span class=price-value>{{ cartTotal | currency:\"\" }}</span></span></div></div></div></div><div class=container><div class=\"panel panel-default items-by-newspaper\"><div class=panel-heading><div class=row><div class=col-md-8><i class=\"ficon ficon-doc-1\"></i> Jornal : Estado de São Paulo</div><div class=col-md-3><button class=\"btn btn-info\"><i class=\"ficon ficon-comment\"></i>observações gerais</button></div><div class=\"col-md-1 text-right\"><button class=\"btn btn-info\"><i class=\"ficon ficon-trash\"></i></button></div></div></div><div class=panel-body><div class=resume><table><tr><td><strong>características</strong></td><td>caderno<br><span class=\"label label-info\">Esportes</span></td><td>formato<br><span class=\"label label-info\">meia página</span></td><td>categoria<br><span class=\"label label-info\">Esportes</span></td><td>dia da semana<br><span class=\"label label-info\">domingo</span></td><td>determinação<br><span class=\"label label-info\">capa</span></td><td>região<br><span class=\"label label-info\"><button>ver regiões</button></span></td><td>cor<br><div class=\"polychrome cian\"></div><div class=\"polychrome yellow\"></div><div class=\"polychrome magent\"></div></td><td>quantidade<br><select><option>1</option></select></td></tr></table></div><div><div class=\"row head\"><div class=col-md-7><strong>itens adicionados</strong></div><div class=col-md-1>observações</div><div class=\"col-md-2 text-center\">*data de publicação</div><div class=\"col-md-2 text-center\">valor</div></div><div class=\"row body\"><div class=col-md-7><button class=\"btn btn-info\"><i class=\"ficon ficon-trash\"></i></button> Anúncio 1</div><div class=\"col-md-1 text-center\"><button class=\"btn btn-info\"><i class=\"ficon ficon-comment\"></i></button></div><div class=\"col-md-2 text-center\"><i class=\"ficon ficon-calendar\"></i><input size=8></div><div class=\"col-md-2 text-center\"><strong>100.000,00</strong></div></div><div class=\"row body\"><div class=col-md-7><button class=\"btn btn-info\"><i class=\"ficon ficon-trash\"></i></button> Anúncio 1</div><div class=\"col-md-1 text-center\"><button class=\"btn btn-info\"><i class=\"ficon ficon-comment\"></i></button></div><div class=\"col-md-2 text-center\"><i class=\"ficon ficon-calendar\"></i><input size=8></div><div class=\"col-md-2 text-center\"><strong>100.000,00</strong></div></div><div class=\"row foot\"><div class=\"col-md-12 text-right\"><strong>Total R$</strong><span class=label>20.000,00</span></div></div></div></div></div><div class=\"panel panel-default items-by-newspaper\"><div class=panel-heading><div class=row><div class=col-md-8><i class=\"ficon ficon-doc-1\"></i> Jornal : Estado de São Paulo</div><div class=col-md-3><button class=\"btn btn-info\"><i class=\"ficon ficon-comment\"></i>observações gerais</button></div><div class=\"col-md-1 text-right\"><button class=\"btn btn-info\"><i class=\"ficon ficon-trash\"></i></button></div></div></div><div class=panel-body><div class=resume><table><tr><td><strong>características</strong></td><td>caderno<br><span class=\"label label-info\">Esportes</span></td><td>formato<br><span class=\"label label-info\">meia página</span></td><td>categoria<br><span class=\"label label-info\">Esportes</span></td><td>dia da semana<br><span class=\"label label-info\">domingo</span></td><td>determinação<br><span class=\"label label-info\">capa</span></td><td>região<br><span class=\"label label-info\"><button>ver regiões</button></span></td><td>cor<br><div class=\"polychrome cian\"></div><div class=\"polychrome yellow\"></div><div class=\"polychrome magent\"></div></td><td>quantidade<br><select><option>1</option></select></td></tr></table></div><div><div class=\"row head\"><div class=col-md-7><strong>itens adicionados</strong></div><div class=col-md-1>observações</div><div class=\"col-md-2 text-center\">*data de publicação</div><div class=\"col-md-2 text-center\">valor</div></div><div class=\"row body\"><div class=col-md-7><button class=\"btn btn-info\"><i class=\"ficon ficon-trash\"></i></button> Anúncio 1</div><div class=\"col-md-1 text-center\"><button class=\"btn btn-info\"><i class=\"ficon ficon-comment\"></i></button></div><div class=\"col-md-2 text-center\"><i class=\"ficon ficon-calendar\"></i><input size=8></div><div class=\"col-md-2 text-center\"><strong>100.000,00</strong></div></div><div class=\"row body\"><div class=col-md-7><button class=\"btn btn-info\"><i class=\"ficon ficon-trash\"></i></button> Anúncio 1</div><div class=\"col-md-1 text-center\"><button class=\"btn btn-info\"><i class=\"ficon ficon-comment\"></i></button></div><div class=\"col-md-2 text-center\"><i class=\"ficon ficon-calendar\"></i><input size=8></div><div class=\"col-md-2 text-center\"><strong>100.000,00</strong></div></div><div class=\"row foot\"><div class=\"col-md-12 text-right\"><strong>Total R$</strong><span class=label>20.000,00</span></div></div></div></div></div><div class=value-purchase><span>Total da compra <span>40.000,00</span></span></div><div class=actions><button type=button class=\"btn btn-primary\" aria-expanded=false ng-click=goSearch()>cancelar</button> <button type=button class=\"btn btn-primary\" aria-expanded=false ng-click=goSearch()>enviar proposta</button></div></div>");
  $templateCache.put("scripts/components/campaigns/campaignsView.html",
    "<div class=container><div class=row><div class=col-md-12>As campanhas serão mostradas aqui</div></div></div>");
  $templateCache.put("scripts/components/purchases/purchasesView.html",
    "<div class=container><div class=row><div class=col-md-12>Suas últimas compras</div></div></div>");
  $templateCache.put("scripts/components/results/resultsView.html",
    "<div class=search-micro-results><div class=row><div class=col-md-4><div class=\"panel panel-default\"><div class=panel-body><div class=section><table><tr class=top><td rowspan=3 colspan=3 class=week-day><a href=#><div class=\"week mon\">Seg</div></a></td><td colspan=4><h4 class=media-heading>Estado de São Paulo</h4></td><td class=added><div><i class=\"ficon ficon-basket\"></i></div></td></tr><tr><td class=padding-0>formato</td><td colspan=2><strong>Meia página</strong></td></tr><tr><td class=padding-0>caderno</td><td colspan=2><strong>Super esportes</strong></td></tr><tr><td colspan=3><div class=\"polychrome cian\"></div><div class=\"polychrome yellow\"></div><div class=\"polychrome magent\"></div></td><td colspan=3 class=reg><i class=\"ficon ficon-location\"></i> <span>ver regiões</span></td><td colspan=2></td></tr><tr><td colspan=5><div class=text-right>R$ <span class=price>5.000,00</span></div></td><td colspan=3 class=text-right><button type=button class=\"btn btn-primary\" ng-click=addToCart(5000) disabled>Adicionar</button></td></tr></table></div></div></div></div><div class=col-md-4><div class=\"panel panel-default\"><div class=panel-body><div class=section><table><tr class=top><td rowspan=3 colspan=3 class=week-day><a href=#><div class=\"week mon\">Seg</div></a></td><td colspan=4><h4 class=media-heading>Estado de São Paulo</h4></td><td class=\"added hide\"><div><i class=\"ficon ficon-basket\"></i></div></td></tr><tr><td class=padding-0>formato</td><td colspan=2><strong>Meia página</strong></td></tr><tr><td class=padding-0>caderno</td><td colspan=2><strong>Super esportes</strong></td></tr><tr><td colspan=3><div class=\"polychrome cian\"></div><div class=\"polychrome yellow\"></div><div class=\"polychrome magent\"></div></td><td colspan=3 class=reg><i class=\"ficon ficon-location\"></i> <span>ver regiões</span></td><td colspan=2></td></tr><tr><td colspan=5><div class=text-right>R$ <span class=price>5.000,00</span></div></td><td colspan=3 class=text-right><button type=button class=\"btn btn-primary\" ng-click=addToCart(5000)>Adicionar</button></td></tr></table></div></div></div></div><div class=col-md-4><div class=\"panel panel-default\"><div class=panel-body><div class=section><table><tr class=top><td rowspan=3 colspan=3 class=week-day><a href=#><div class=\"week mon\">Seg</div></a></td><td colspan=4><h4 class=media-heading>Estado de São Paulo</h4></td><td class=\"added hide\"><div><i class=\"ficon ficon-basket\"></i></div></td></tr><tr><td class=padding-0>formato</td><td colspan=2><strong>Meia página</strong></td></tr><tr><td class=padding-0>caderno</td><td colspan=2><strong>Super esportes</strong></td></tr><tr><td colspan=3><div class=\"polychrome cian\"></div><div class=\"polychrome yellow\"></div><div class=\"polychrome magent\"></div></td><td colspan=3 class=reg><i class=\"ficon ficon-location\"></i> <span>ver regiões</span></td><td colspan=2></td></tr><tr><td colspan=5><div class=text-right>R$ <span class=price>5.000,00</span></div></td><td colspan=3 class=text-right><button type=button class=\"btn btn-primary\" ng-click=addToCart(5000)>Adicionar</button></td></tr></table></div></div></div></div></div></div>");
  $templateCache.put("scripts/components/search/searchMenuView.html",
    "<div ng-controller=SearchMenuCtrl><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Jornais <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in newspappers\">{{item.name}} <span class=\"badge pull-right\">{{item.count}}</span></a></div></accordion-group></accordion><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Categorias <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in categories\">{{item.name}} <span class=\"badge pull-right\">{{item.count}}</span></a></div></accordion-group></accordion><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Dias da Semana <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in weekdays\">{{item.name}} <span class=\"badge pull-right\">{{item.count}}</span></a></div></accordion-group></accordion><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Determinações <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in determinations\">{{ item.name }} <span class=\"badge pull-right\">{{ item.count }}</span></a></div></accordion-group></accordion><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Formatos <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in formats\">{{ item.name }} <span class=\"badge pull-right\">{{ item.count }}</span></a></div></accordion-group></accordion><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Perfis <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in profiles\">{{ item.name }} <span class=\"badge pull-right\">{{ item.count }}</span></a></div></accordion-group></accordion><accordion close-others=false><accordion-group is-open=status.open><accordion-heading ng-click=\"status.open = !status.open\">Cadernos <i class=\"pull-right ficon\" ng-class=\"{'ficon-down-open': status.open, 'ficon-right-open': !status.open}\"></i></accordion-heading><div class=list-group><a class=list-group-item ng-repeat=\"item in sections\">{{ item.name }} <span class=\"badge pull-right\">{{ item.count }}</span></a></div></accordion-group></accordion></div>");
  $templateCache.put("scripts/components/search/searchView.html",
    "<div class=container><div class=row><div class=col-md-3><h2>Busca de Ofertas</h2></div><div class=\"col-md-4 col-md-offset-1\"><div class=advertiser-toggle><span class=advertiser-label>Anunciante</span><div class=btn-group dropdown is-open=status.isopen><button type=button class=\"btn btn-info dropdown-toggle\" dropdown-toggle ng-disabled=disabled>Predicta <span class=caret></span></button><ul class=dropdown-menu role=menu><li><a href=#>Infoglobo</a></li><li><a href=#>Fast Ads</a></li><li><a href=#>Outro anunciante</a></li><li class=divider></li><li><a href=#>Ver restante</a></li></ul></div></div></div><div class=col-md-4><div class=\"cart-button clickable\" ng-click=goCart()><span class=cart-icon><i class=\"ficon ficon-basket\"></i></span> <span class=cart-quantity><span>1</span></span> <span class=cart-total><span class=price-label>R$</span> <span class=price-value>{{ cartTotal | currency:\"\" }}</span></span></div></div></div></div><div class=container><div class=\"row whitey\"><div class=col-md-12><span class=\"terms-label fort search-labels\">Seus critérios</span><div class=\"terms-box boxed\"><span class=\"label label-info\">jornal A</span> <span class=\"label label-info\">jornal B</span> <span class=\"label label-info\">1/2 pagina</span> <span class=\"label label-info\">todos os cadernos</span></div><button type=button class=\"btn btn-primary pull-right\" ng-click=modal(new-search)>Nova busca <i class=\"ficon ficon-down-open\"></i></button></div></div></div><div class=container><div class=\"row whitey\"><div class=col-md-12><span class=\"filter-label fort search-labels\">Filtros</span><div class=filter-box><span class=filter-label>preco</span><select name=\"\" class=\"form-control whitey-sel\"><option value=0>todos</option><option value=\"\" selected>até R$1.000,00</option><option value=\"\">de R$1.000,00 até R$20.000,00</option><option value=\"\">de 20.000,00 até R$100.000,00</option><option value=\"\">de 100.000,00 em diante</option></select></div><div class=filter-box><span class=filter-label>dias da semana</span><select name=\"\" class=\"form-control whitey-sel\"><option value=\"\">todos os dias</option><option value=\"\" selected>Domingo</option><option value=\"\">Segunda</option><option value=\"\">Terça</option><option value=\"\">Dona Mingo</option></select></div><div class=filter-box><span class=filter-label>cores</span><select name=\"\" class=\"form-control whitey-sel\"><option value=\"\">Cromia</option><option value=\"\">PB</option><option value=\"\">Rosa Nike XOKS</option></select></div></div></div></div><div class=container><div class=\"row search-results\"><div class=col-md-12><div class=\"row search-toolbar\"><span class=result-count>{{ formatResults(resultData.count) }}</span><div class=pull-right><span class=filter-label>ordenacao</span><select name=\"\" class=\"form-control whitey-sel\"><option value=\"\">Ascendente</option><option value=\"\">Por fases da lua</option><option value=\"\">Em marte</option></select><span class=filter-label>views</span> <button class=\"btn btn-default\"><i class=\"ficon ficon-layout\"></i></button> <button class=\"btn btn-default\"><i class=\"ficon ficon-menu\"></i></button> <span><i class=ficon></i></span></div></div><div ng-include=results></div></div></div></div>");
  $templateCache.put("scripts/shared/aboutView.html",
    "<p>This is the about view.</p>");
  $templateCache.put("scripts/shared/footer/footerView.html",
    "<div class=container><span class=pull-right><img src=images/predicta-footer.png alt=\"Predicta - Direct\"></span></div>");
  $templateCache.put("scripts/shared/header/headerView.html",
    "<div class=container><div class=row><div class=col-md-12><h1 class=\"invisible pull-right\">Marketplace</h1><img src=images/logo_market_place.png alt=Marketplace></div></div></div>");
  $templateCache.put("scripts/shared/login/loginView.html",
    "<div ng-show=!isNewPass ng-controller=LoginCtrl><div id=login ng-hide=isForgotten><div class=header><img src=../images/logo_market_place.png></div><div class=login><form action method=POST name=form-login id=form-login><input name=username required placeholder=e-mail id=username> <input type=password name=password required placeholder=senha id=password> <button type=submit class=\"btn btn-primary\">Entrar</button></form><button type=button ng-click=resetPass() class=link-button>Esqueci a senha</button></div></div><div id=reset-pass ng-show=\"isForgotten && !isSendEmail\"><div class=header><img src=../images/logo_market_place.png></div><div class=login><form class=reset-pass><h3>Esqueceu sua senha?</h3><div><p>Digite o endereço de e-mail usado para criar sua conta.</p><p>Vamos localizar suas informações e lhe enviar um e-mail com um link para redefinir sua senha.</p></div><fieldset><input placeholder=e-mail> <button type=button class=\"btn btn-primary\" ng-click=sendEmail()>Enviar</button> <button type=button class=\"btn btn-info\" ng-click=resetPass()>cancelar</button></fieldset></form></div></div><div id=sendEmail ng-show=\"isForgotten && isSendEmail\"><div class=header><img src=../images/logo_market_place.png></div><div class=login><form class=reset-pass><h3>Esqueceu sua senha?</h3><div><p>Confira seu e-mail! Enviamos um link para que você possa redefinir sua senha.</p><p>Este e-mail contém um link que o levará para uma página onde você pode criar uma nova senha.</p><p>Se você não receber este e-mail dentro de alguns minutos, verifique sua pasta de spam, ou envie um outro pedido.</p></div><fieldset><button type=button class=\"btn btn-info\" ng-click=\"isSendEmail = false\">enviar o email novamente</button> <button type=button class=\"btn btn-primary\" ng-click=resetPass()>login</button></fieldset></form></div></div></div><div ng-show=isNewPass ng-controller=LoginCtrl><div class=header><img src=../images/logo_market_place.png></div><div class=login><form class=\"reset-pass new-pass\"><h3>Definir senha</h3><strong>Por favor defina uma nova senha</strong><div><p>Para que sua senha seja válida ela deve ter no mínimo:</p><p>8 caracteres - uma letra maíuscula - uma letra minúscula - um número.</p></div><table><tr><td>Senha</td><td>Confirme a senha</td></tr><tr><td><input type=password placeholder=senha></td><td><input type=password placeholder=senha></td></tr></table><fieldset><button type=button class=\"btn btn-info\" ng-click=\"isNewPass = false\">cancelar</button> <button type=button class=\"btn btn-primary\" ng-click=\"isNewPass = false\">salvar</button></fieldset></form></div></div>");
  $templateCache.put("scripts/shared/mainView.html",
    "<div class=container><div class=jumbotron><h1>'Allo, 'Allo!</h1><p class=lead><img src=images/yeoman.png alt=\"I'm Yeoman\"><br>Always a pleasure scaffolding your apps.</p><p><a class=\"btn btn-lg btn-success\" ng-href=#>Splendid!<span class=\"glyphicon glyphicon-ok\"></span></a></p></div><div class=\"row marketing\"><h4>HTML5 Boilerplate</h4><p>HTML5 Boilerplate is a professional front-end template for building fast, robust, and adaptable web apps or sites.</p><h4>Angular</h4><p>AngularJS is a toolset for building the framework most suited to your application development.</p><h4>Karma</h4><p>Spectacular Test Runner for JavaScript.</p></div></div>");
  $templateCache.put("scripts/shared/nav/navView.html",
    "<nav class=\"navbar navbar-default\" role=navigation><div class=container><div class=navbar-header><button type=button class=\"navbar-toggle collapsed\" data-toggle=collapse data-target=#navbar aria-expanded=false aria-controls=navbar><span class=sr-only>Toggle navigation</span> <span class=icon-bar></span> <span class=icon-bar></span> <span class=icon-bar></span></button></div><div ng-controller=NavCtrl class=\"collapse navbar-collapse\" id=navbar><ul class=\"nav navbar-nav\"><li ng-class=\"{ active:isActive('/search')||isActive('/results') }\"><a href=/search>Ofertas</a></li><li ng-class=\"{ active:isActive('/purchases') }\"><a href=/purchases>Últimas compras</a></li><li ng-class=\"{ active:isActive('/bids')}\"><a href=/bids>Propostas</a></li></ul></div></div></nav>");
}]);
