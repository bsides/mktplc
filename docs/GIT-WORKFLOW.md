### Passo 1: Baixe a última versão de develop e inicie sua nova feature branch a partir dela. __Verifique se não tem nada modificado antes, pois irá perder tudo!__

```
git status  # para verificar se não tem nada modificado
git fetch upstream  # apenas baixa branches de upstream
git checkout develop  # muda para sua branch local develop
git reset --hard upstream/develop  # deixa seu branch develop igual upstream
git checkout -b sua-nova-feature-branch  # cria sua-nova-feature-branch a partir de upstream/develop
```

### Passo 2: Trabalhe na sua branch. Comite frequentemente. Volte atrás, edite, envie ao seu origin, etc. Alguns comandos úteis:

```
git add . -A  # adiciona todos os arquivos, inclusive deletados
git commit -a  # comita adicionando arquivos
git reset --hard HASH  # volta para HASH
git push origin sua-nova-feature-branch  # envia ao seu origin
git fetch rafael  # pega branches do remote chamado rafael
git cherry-pick HASH  # pega um commit e dá merge na branch que está (hash é único, pode ser de outro remote)
```

### Passo 3: Acabou o trabalho, dê rebase/squash em commits que não servem pra nada, envie a upstream, faça um Merge Request e peça para alguém aceitar/comentar nele.

```
git rebase -i HEAD~NUMERO-DE-COMMITS-A-SQUASHAR  # para dar squashes em commits, se tiver dúvida fale no Slack
git push upstream sua-nova-feature-branch
```

- Na interface do Gitlab, o botão de Merge Request deve estar aceso. Clique nele. Caso não esteja disponível o botão, seu branch não poderá ser mergeado com develop. Volte e conserte conflitos se necessário.

![](http://i.imgur.com/dwJlkNK.png)

---

- Na tela de Merge Request, preencha a descrição __sucintamente__ com o que fez nessa branch. Tente descrever por tópicos. Os outros campos podem ficar como estão. Clique em Submit Merge Request.

![](http://i.imgur.com/xLOYQbb.png)

---

- Peça para alguém avaliar seu trabalho (Slack ou pessoalmente). A pessoa que avaliar ficará responsável por este QA. Para o avaliador: acesse a aba Changes e comente nas linhas que achar necessário. Use a aba Discussion para fazer comentários fora do código ou ver o histórico. Se tiver algo a ser feito, avise a pessoa (Slack ou pessoalmente).

![](http://i.imgur.com/N83bN4z.png)

---

- Se tiver algo a ser feito, faça na mesma branch que trabalhou até agora e reenvie ela para o upstream de novo (exatamente como fez antes). O Gitlab automaticamente vê suas mudanças e muda a aba Discussion/Changes refletindo essas mudanças. Peça para a mesma pessoa que avaliou antes avaliar de novo (Slack ou pessoalmente). Se ela não puder e for urgente, peça pra outra pessoa. OBS - no exemplo, estou mandando pra origin. Você deve mandar pra upstream, exatamente como fez antes.

![](http://i.imgur.com/gaGa6gc.png)

![](http://i.imgur.com/vNRhOMJ.png)

---

- O avaliador achou outro erro. Tudo de novo, em exemplos:

![](http://i.imgur.com/7wTJxSz.png)

![](http://i.imgur.com/rKNZSvK.png)

![](http://i.imgur.com/tQdPhMN.png)

---

- Se estiver tudo ok desta vez, o avaliador dá um joinha (código é : +1 : tudo junto)

!(http://i.imgur.com/abzpwoq.png)

---

- Agora você pode fazer o seu merge. Dá pra fazer tanto no gitlab quanto via linha de comando. O Gitlab te ensina nesse botão quando não dá pra fazer via interface:

![](http://i.imgur.com/8QBjOB8.png)

---

- Se tudo ocorrer bem, você verá que o merge foi feito com sucesso na interface do Gitlab. Pronto!

![](http://i.imgur.com/ucNd0J1.png)
