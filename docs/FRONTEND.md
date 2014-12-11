# Frontend
Documentação sobre o frontend

1. [Requerimentos](#requerimentos)
1. [Fork & Clone](#fork-amp-clone)
1. [Instale](#instale)
1. [Rode o front em desenvolvimento](#rode-o-front-em-desenvolvimento)
1. [Rode o front para deploy](#rode-o-front-para-deploy)

## Requerimentos
Instale as ferramentas necessárias para rodar o frontend

* Git
* Node com NPM
* Ruby via RVM com suporte a GEMs
* Grunt via NPM
* Bower via NPM
* Sass via GEM
* Compass via GEM

#### Git
  
Linux: `sudo apt-get install git`

OSX: `brew install git` (é necessário ter o [Homebrew](http://brew.sh/) instalado)

#### Node com NPM

Linux: [siga este guia](http://tnovelli.net/blog/blog.2011-08-27.node-npm-user-install.html)

OSX: `brew install node`

#### Ruby via RVM com suporte a GEMs

[Acesse esse link](https://rvm.io/). Jamais instale com sudo!

``\curl -sSL https://get.rvm.io | bash -s stable``
``rvm install ruby``

#### Grunt via NPM

``npm install -g grunt-cli``

#### Bower via NPM

``npm install -g bower``

#### Sass via GEM

``gem install sass``

#### Compass via GEM

``gem install compass``

## Fork & Clone
Forke o projeto [na interface do Gitlab](http://gitlab.corp.predicta.com.br:81/infra/marketplace), clone do seu origin

![](http://i.imgur.com/DOWQUcK.png)

``git clone git@gitlab.corp.predicta.com.br:SEU-USUARIO/marketplace.git``

## Instale
Instale as ferramentas usadas no projeto. Verifique se não dá nenhum erro. Se der erro, veja com alguém do Front para te ajudar.

```
cd frontend
npm install
bower install
```

## Rode o front em desenvolvimento
Esse comando deve ser usado somente em desenvolvimento

```
cd frontend
grunt dev
```

## Rode o front para deploy
Esse comando deve ser usado apenas para enviar o pacote para deploy

``
cd frontend
grunt build # ou grunt publish ou grunt deploy
``
