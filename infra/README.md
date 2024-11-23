# IaC - Infrastructure as Code

Recursos para gerenciamento e provisionamento da infraestrutura por meio de código.

# Google Cloud Platform (GCP)

Para permitir utilizar os recursos do GCP, é necessário ter o CLI do Google Cloud instalado e
configurado. [Google Cloud CLI](https://cloud.google.com/sdk/docs/install?hl=pt-br)

Instale o gcloud:

### windows:

```bash
choco install google-cloud-sdk
```

### linux:

```bash 
sudo apt update && sudo apt install google-cloud-sdk -y
```

Também é necessário estar autenticado no GCP. Para isso, utilize o comando:

```bash
gcloud auth login
```

Para configurar as credenciais do GCP no ambiente local, utilize o comando:

```bash
gcloud auth application-default login
```

Para criar um projeto no GCP e alterar as variáveis do projeto terraform para o novo projeto criado.

```bash
gcloud projects create <PROJECT_ID> --name=<PROJECT_NAME>
```

Para listar todos os projetos da sua conta, utilize o comando:

```bash 
gcloud projects list
```

Para definir o projeto padrão a ser utilizado, utilize o comando:

```bash
gcloud config set project[PROJECT_ID]
```

## k8s

Armazena os manifests do Kubernetes (YAML) para deployment, serviços, configmaps, etc.

## terraform

Contém a infraestrutura como código para o provisionamento do cluster Kubernetes, rede, e banco de dados usando
Terraform

Instale o terraform:

* windows: `choco install terraform`
* linux: `sudo apt-get install terraform`

Instale o kubectl:

* windows: `choco install kubernetes-cli`
* linux: `sudo apt-get install kubectl`

Instale o gke-gcloud-auth-plugin:

* `gcloud components install gke-gcloud-auth-plugin`

No diretorio do arquivo `main.tf`, apenas na primeira vez para criar o arquivo necessário, execute o comando:
`terraform init`.

Caso tenha sido realizado alguma alteração nos recursos, para atualiza-los, utilize: `terraform init -upgrade`

Esse comando irá gerar o diretorio `.terraform` com a instalação dos recursos necessários. Também ira criar o arquivo
`.terraform.lock.hcl` com configurações de versões dos downloads realizados.

Quando aplicado uma infraestrutura, o arquivo `terraform.tfstate` é gerado com as informações necessárias dos recursos
implantados, possibilitando a atualização e detruição da infraestrutura.

Utilize o comando a seguir para verificar as alterações que serão aplicadas a infraestrutura:

` terraform plan `

É possivel executar o comando a seguir para implantar a infraestrutura:

` terraform apply `

No mesmo diretorio, para interromper o que foi implantado, utilza-se o comando:

`terraform destroy`

Mais comandos interessantes

* Para formatar o arquivo, utilize: `terraform fmt`
* Para validar se o arquivo esta sintaticamente correto: `terraform validate`
* Inspeciona o estado atual gerado pela implantação: `terraform show`

### terraform/environments/dev/ - Configurações para o ambientes

* dev: para o Ambiente Dev
* prod: para o Ambiente Produção
* staging: para o Ambiente Homologação

Todos contém arquivo `main.tf` para referenciar o módulo `rds`.

### terraform/modules/rds/ - Relational Database Service

Módulo para Configuração do PostgreSQL.

* main.tf: Define a criação da instância Cloud SQL PostgreSQL.
* variables.tf: Define as variáveis usadas no módulo.
* outputs.tf: Define as saídas do módulo, como o IP da instância.*/

### terraform/modules/state_bucket/ - Cloud Storage para terraform states

* main.tf: Define a criação do bucket para armazenar os estados remotamente.
* variables.tf: Define as variáveis usadas no módulo.
* outputs.tf: Define as saídas do módulo, como o nome do bucket.*/

### terraform/main.tf - Arquivo Principal

O `main.tf` na raiz conecta os módulos e define o ambiente padrão a ser provisionado.


