# Longeviver Fitness

Longeviver Fitness é um projeto de uma API desenvolvida em Kotlin com Spring Boot, que utiliza PostgreSQL como banco de
dados e é gerenciada via Docker e Kubernetes. Este projeto foi criado com o objetivo de fornecer suporte para exercícios
de condicionamento físico em um ambiente de longa vida.

## Pré-requisitos

Certifique-se de que as seguintes ferramentas estejam instaladas:

* [Docker](https://docs.docker.com/engine/install/ubuntu/)
* [Minikube](https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download)
* [Kubernetes](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/) (kubectl)
* [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/) (Kubernetes in Docker)
* [Java 21](https://www.oracle.com/java/technologies/javase/jdk21-archive-downloads.html)
* [Maven](https://maven.apache.org/)
* [PostgreSQL](https://www.postgresql.org/download/)

## Docker

Comandos úteis para criar e gerenciar o ambiente Docker:

* Criar container com imagem do postgresSQL
   * `docker pull postgres`
   * `docker run --name meu_postgres -e POSTGRES_USER=meu_usuario -e POSTGRES_PASSWORD=minha_senha -e POSTGRES_DB=meu_banco -p 5432:5432 -d postgres`


* Criar imagem Docker a partir do [Dockerfile:](Dockerfile)
    * `docker build -t longeviverapi:1.0 .`
* Criar um container a partir da imagem criada (add --network="host" para o Docker conectar ao localhost do PostgreSQL):
    * `docker run -p 8080:8080 longeviverapi:1.0`
    * `docker run --network="host" -p 8080:8080 longeviverapi:1.0`

## Kubectl

Comandos principais para gerenciar o ambiente Kubernetes com kubectl:

* Criar pod deployment e service:
    * `kubectl apply -f pod.yaml`
    * `kubectl apply -f deployment.yaml`
    * `kubectl apply -f service.yaml`
* Deletar pod deployment e service:
    * `kubectl delete pod nome-do-pod`
    * `kubectl delete deployment nome-do-pod`
    * `kubectl delete service nome-do-pod`
* Listar pod, deployment e service:
    * `kubectl get pods`
    * `kubectl get deployment`
    * `kubectl get service`
* Ver logs dos pod:
    * `kubectl logs nome-do-pod`
* Criar um túnel temporário entre o seu computador e o pod
    * `kubectl port-forward service/longeviver-fitness-app 8080:8080`
* Mais comandos
  úteis [20 Comandos kubectl](https://nerdexpert.com.br/20-principais-comandos-kubectl-que-um-devops-deve-dominar/#google_vignette)

## Kind (Kubernetes in Docker)

Comandos para gerenciar clusters Kubernetes com Kind:

* Criar/Deletar cluster do kind: 
  * `kind create cluster`
  * `kind delete cluster`
* Verificar se o kind-control-plane está em execução:
  * `docker ps -a | grep kind`
* Carregar imagem Docker no Kind para uso com kubectl:
  * `kind load docker-image longeviverapi:1.0`
