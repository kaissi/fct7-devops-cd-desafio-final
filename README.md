# fct7-devops-cd-desafio-final
Code Education | Full Cycle Turma 7 | DevOps | Continuous Deployment - Desafio Final

Sistema feito em Go que realiza a soma de duas variáveis passadas como parâmetro.

Ex: http://localhost:8080/soma?x=2&y=3

## 1. Informações Gerais

Execute `make help` para ver os comandos disponíveis.

Execute `make get-archs` para ver todas as plataformas disponíveis para compilação.

## 2. Fazendo o Build

Execute `make build` para fazer o build para a plataforma local.

Execute `make build-arm64` para fazer o build para uma plataforma específica.

Execute `make build-all` para fazer o build para todas as plataformas disponíveis.

## 3. Executando o sistema

### 3.1 Standalone

Execute `make run`.

O sistema estará disponível em `http://localhost:8080/soma?x=2&y=3`.

Execute `make delete` para deletar o container em execução.

### 3.2 Kubernetes

Execute `kubectl apply -f ./k8s`.

O sistema estará disponível em `http://<ip-externo-do-cluster>/soma?x=2&y=3`.

## 4. Fazendo Deploy das Imagens Docker

Execute `make release` para fazer o build para todas as plataformas, fazer o push para o Docker Hub e gerar e fazer o push do Manifest que permitirá o Docker escolher automaticamente a plataforma correta a ser utilizada a imagem for baixada para ser executada.
