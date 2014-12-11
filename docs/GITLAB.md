### Passo 1: crie sua ssh-key. No prompt, digite:

``ssh-keygen -t rsa -C "seu-email@predicta.net"``

  * A próxima pergunta é onde vai salvar sua key. Se tiver mais de uma, modifique o caminho e o nome. Se for a primeira ou não souber, deixe como está e dê enter.
  * As próximas perguntas são sobre a senha. Se quiser, coloque uma, senão dê enter apenas e ele ficará sem senha.

### Passo 2: coloque sua keygen no gitlab
  * Acesse http://gitlab.corp.predicta.com.br:81/profile/keys
  * Cole sua chave pública aí. Exemplo

  ``cat /Users/seu-usuário/.ssh/id_rsa.pub``

  * Copie o conteúdo desse arquivo pra lá. Se for outro nome, especifique aí.

### Passo 3: se sua chave pública for diferente de id_rsa
Altere ou crie um novo arquivo caso ele não exista: ~/.ssh/config

```
Host gitlab.corp.predicta.com.br
IdentityFile /Users/seu-usuario/.ssh/seu-identity-file (sem .pub)
```

### Passo 4: Adicione seu origin e o upstream como remotes do projeto

``git remote add upstream git@gitlab.corp.predicta.com.br:infra/marketplace.git``
``git remote add origin git@gitlab.corp.predicta.com.br:SEU-USUARIO-GITLAB/marketplace.git``

Se já existir o remote origin antigo, remova ele antes e coloque esse. Por exemplo, eu fiz o seguinte (modifique a url com seu usuário!):

```
git remote rm origin
git remote add origin git@gitlab.corp.predicta.com.br:rpereira/marketplace.git
git remote add old ssh://rpereira@10.0.1.254/home/repos/direct_marketplace
git remote add upstream git@gitlab.corp.predicta.com.br:infra/marketplace.git
```

Não faça mais commits ou use o repositório antigo (old acima)! Ele será removido em muito breve!

### Passo 5: Adicione o remote das outras pessoas do time (opcional)
Apesar de ser considerado opcional, é muito útil quando estamos em branches de testes que queremos compartilhar com os outros. Se vocês tiverem os remotes alheios, poderão sempre pegar as coisas deles. Não dê push em remote alheio, a não ser que aprovado por essa pessoa, ok?

  - Vá no perfil de cada um e clique no respositório Marketplace
  ![](http://i.imgur.com/TXJzepI.png)

  - Copie a url do remote desse usuário e adicione. Dica: coloque o nome da pessoa como o nome do remote, assim vai saber do que se trata.
  ![](http://i.imgur.com/YfknTsB.png)

  Exemplo:
  ```
git remote add rafael git@gitlab.corp.predicta.com.br:rpereira/marketplace.git
```

### Problemas
  - Meu id_rsa não está sendo aceito! Error: Agent admitted failure to sign

  Aconteceu com o Rodrigo. O agente ssh dele não estava lendo o identity file certo. Veja a solução [nesse link](https://help.github.com/articles/error-agent-admitted-failure-to-sign/).
