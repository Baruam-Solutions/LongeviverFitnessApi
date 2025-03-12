# IaC - Infrastructure as Code
Recursos para gerenciamento e provisionamento da infraestrutura por meio de código. 

## k8s

Armazena os manifests do Kubernetes (YAML) para deployment, serviços, configmaps, etc.

## terraform

Contém a infraestrutura como código para o provisionamento do cluster Kubernetes, rede, e banco de dados usando Terraform

Instale o terraform:
* windows: `choco install terraform`
* linux: `sudo apt-get install terraform`

// todo: verificar comando. foi incluido por sugestão do copilot

Instale o gcloud:
* windows: `choco install google-cloud-sdk` 
* linux: `sudo apt-get install google-cloud-sdk`

Instale o kubectl:
* windows: `choco install kubernetes-cli`
* linux: `sudo apt-get install kubectl`

Instale o gke-gcloud-auth-plugin: 
* `gcloud components install gke-gcloud-auth-plugin`

No diretorio do arquivo `main.tf`, apenas na primeira vez para criar o arquivo necessário, execute o comando: `terraform init`.

Caso tenha sido realizado alguma alteração nos recursos, para atualiza-los, utilize: `terraform init -upgrade`

Esse comando irá gerar o diretorio `.terraform` com a instalação dos recursos necessários. Também ira criar o arquivo `.terraform.lock.hcl` com configurações de versões dos downloads realizados. 

Quando aplicado uma infraestrutura, o arquivo `terraform.tfstate` é gerado com as informações necessárias dos recursos implantados, possibilitando a atualização e detruição da infraestrutura.  

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

## GCP

Para realizar a implantação dos recursos na núvem, é necessário ter o CLI do GCP instalado e devidamente autenticado na conta Google.

* [Instalar a CLI gcloud](https://cloud.google.com/sdk/docs/install?hl=pt-br)
* [Autorizar a CLI gcloud](https://cloud.google.com/sdk/docs/install?hl=pt-br)
* [Configuração de autenticação da gcloud CLI e configuração do ADC](https://cloud.google.com/docs/authentication/gcloud?hl=pt-br#gcloud-credentials)
* [Como definir propriedades de configuração](https://cloud.google.com/sdk/docs/configurations?hl=pt-br#setting_configuration_properties)




