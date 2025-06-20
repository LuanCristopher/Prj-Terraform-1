# Infraestrutura GCP com Terraform

## Descrição Geral

Este projeto provisiona uma infraestrutura base na Google Cloud Platform (GCP) utilizando Terraform. Ele configura redes VPC, sub-redes, regras de firewall e instâncias de máquinas virtuais (VMs) distribuídas em diferentes regiões e zonas. O projeto é modularizado para separar as preocupações de rede (VPC) e computação (instâncias).

## Pré-requisitos

*   Uma conta ativa na Google Cloud Platform.
*   Terraform **v1.4.0** (conforme configurado no pipeline de CI/CD).
*   `gcloud` CLI (opcional, útil para gerenciamento de autenticação e configuração local).

## Estrutura do Projeto

O repositório está organizado da seguinte forma:

*   `/`: Contém os arquivos Terraform de orquestração raiz (`main.tf`, `main-variables.tf`), que definem os módulos a serem implantados e as variáveis globais.
*   `instance/`: Módulo Terraform responsável pelo provisionamento e gerenciamento das instâncias de VM (Google Compute Engine).
*   `vpc/`: Módulo Terraform responsável pela configuração da infraestrutura de rede, incluindo VPCs, sub-redes e regras de firewall.
*   `.github/workflows/`: Contém o pipeline de CI/CD configurado com GitHub Actions para automação de `init`, `validate`, `plan` e `apply` (manual) do Terraform.

## Configuração de Credenciais

### Pipeline de CI/CD

O pipeline de CI/CD configurado em `.github/workflows/terraform.yml` utiliza um segredo do GitHub chamado `GOOGLE_CREDENTIALS`. Este segredo deve conter as credenciais de uma conta de serviço GCP com as permissões necessárias para criar e gerenciar os recursos definidos neste projeto.

### Desenvolvimento Local

Para desenvolvimento ou execução local do Terraform, as credenciais do GCP podem ser configuradas de duas maneiras principais:

1.  **Application Default Credentials (ADC) via `gcloud` CLI:**
    ```bash
    gcloud auth application-default login
    ```
    Este comando autentica você e armazena as credenciais localmente, que o Terraform pode usar automaticamente.

2.  **Variável de Ambiente `GOOGLE_APPLICATION_CREDENTIALS`:**
    Você pode definir a variável de ambiente `GOOGLE_APPLICATION_CREDENTIALS` para apontar para o caminho de um arquivo JSON da chave da conta de serviço:
    ```bash
    export GOOGLE_APPLICATION_CREDENTIALS="/caminho/para/sua/chave-sa.json"
    ```

## Como Usar

1.  **Clone o repositório:**
    ```bash
    git clone <url-do-repositorio>
    cd <diretorio-do-repositorio>
    ```

2.  **Inicialize o Terraform:**
    Este comando baixa os provedores necessários e inicializa os módulos.
    ```bash
    terraform init
    ```

3.  **Planeje as mudanças:**
    Este comando mostra quais recursos serão criados, modificados ou destruídos.
    ```bash
    terraform plan
    ```

4.  **Aplique as mudanças:**
    Este comando provisiona a infraestrutura na GCP.
    ```bash
    terraform apply
    ```
    No pipeline de CI/CD, a etapa de `apply` é executada apenas manualmente (via `workflow_dispatch`) ou em pushes diretos para a branch `master` para evitar alterações acidentais.

## Variáveis de Entrada Principais

Estas variáveis são definidas em `main-variables.tf` e controlam os aspectos chave da infraestrutura. Abaixo estão algumas das mais importantes:

| Nome da Variável              | Descrição                                       | Tipo          | Padrão                                  |
| ----------------------------- | ----------------------------------------------- | ------------- | --------------------------------------- |
| `luan_vm_sp`                  | Nome para a VM de São Paulo                      | `string`      | `"luan-vm-sp"`                          |
| `luan_vm_sp2`                 | Nome para a segunda VM de São Paulo              | `string`      | `"luan-vm-sp2"`                         |
| `luan_vm_chile`               | Nome para a VM do Chile                         | `string`      | `"luan-vm-chile"`                       |
| `luan_vm_iowa`                | Nome para a VM de Iowa                          | `string`      | `"luan-vm-iowa"`                        |
| `luan_vm_europe`              | Nome para a VM da Europa                        | `string`      | `"luan-vm-europe"`                      |
| `zone_sp`                     | Zona para recursos de São Paulo                 | `string`      | `"southamerica-east1-a"`                |
| `zone_chile`                  | Zona para recursos do Chile                     | `string`      | `"southamerica-west1-a"`                |
| `zone_iowa`                   | Zona para recursos de Iowa                      | `string`      | `"us-central1-a"`                       |
| `zone_europe`                 | Zona para recursos da Europa                    | `string`      | `"europe-central2-a"`                   |
| `vm_machine_type`             | Tipo de máquina para as VMs                     | `string`      | `"e2-micro"`                            |
| `disk_image_uri`              | URI da imagem de disco para as VMs                | `string`      | `"ubuntu-os-cloud/ubuntu-2004-lts"`     |
| `disk_size_gb`                | Tamanho do disco em GB para as VMs                | `number`      | `10`                                    |
| `vm_tags`                     | Tags a serem aplicadas às VMs                   | `list(string)`| `["minha-tag"]`                         |
| `luan_vpc_1_name`             | Nome para a primeira VPC                        | `string`      | `"luan-vpc-1"`                          |
| `luan_vpc_2_name`             | Nome para a segunda VPC                         | `string`      | `"luan-vpc-2"`                          |
| `subnet_sp_name`              | Nome para a sub-rede de São Paulo               | `string`      | `"subnet-sp"`                           |
| `subnet_chile_name`           | Nome para a sub-rede do Chile                   | `string`      | `"subnet-chile"`                        |
| `subnet_iowa_name`            | Nome para a sub-rede de Iowa                    | `string`      | `"subnet-iowa"`                         |
| `subnet_europe_name`          | Nome para a sub-rede da Europa                  | `string`      | `"subnet-europe"`                       |
| `ip_cidr_range_sp`            | Range CIDR IP para a sub-rede de São Paulo      | `string`      | `"192.168.60.0/28"`                     |
| `ip_cidr_range_chile`         | Range CIDR IP para a sub-rede do Chile          | `string`      | `"192.168.60.16/28"`                    |
| `ip_cidr_range_iowa`          | Range CIDR IP para a sub-rede de Iowa           | `string`      | `"192.168.61.0/28"`                     |
| `ip_cidr_range_europe`        | Range CIDR IP para a sub-rede da Europa         | `string`      | `"192.168.61.16/28"`                    |
| `region_southamerica_east1`   | Região para recursos de São Paulo               | `string`      | `"southamerica-east1"`                  |
| `region_southamerica_west1`   | Região para recursos do Chile                   | `string`      | `"southamerica-west1"`                  |
| `region_us_central1`          | Região para recursos de Iowa                    | `string`      | `"us-central1"`                         |
| `region_europe_central2`      | Região para recursos da Europa                  | `string`      | `"europe-central2"`                     |

_(Consulte `main-variables.tf` para a lista completa de variáveis e seus valores padrão.)_

## Módulos

Este projeto utiliza os seguintes módulos:

*   **[Módulo VPC](./vpc/README.md):** Responsável por toda a configuração de rede, incluindo VPCs, sub-redes, peering entre VPCs e regras de firewall.
*   **[Módulo Instance](./instance/README.md):** Responsável pelo provisionamento das máquinas virtuais Google Compute Engine.

Clique nos links acima para acessar os READMEs específicos de cada módulo e entender suas variáveis de entrada e recursos criados.

## CI/CD

O projeto inclui um pipeline de Continuous Integration/Continuous Deployment (CI/CD) usando GitHub Actions, definido no arquivo `.github/workflows/terraform.yml`. O workflow automatiza os seguintes passos em eventos de `push` e `pull_request` para a branch `master`, ou quando disparado manualmente:

1.  **Checkout do código.**
2.  **Configuração do Terraform (v1.4.0).**
3.  **Configuração das credenciais GCP** (a partir do segredo `GOOGLE_CREDENTIALS`).
4.  **Validação do arquivo JSON das credenciais.**
5.  **`terraform init`**: Inicialização do Terraform.
6.  **`terraform validate`**: Validação da sintaxe dos arquivos Terraform.
7.  **`terraform fmt -check`**: Verificação da formatação do código.
8.  **`terraform plan`**: Geração do plano de execução.
9.  **`terraform apply`**: Aplicação das mudanças (condicionado a ser um `workflow_dispatch` manual ou um `push` direto para `master`).

Este pipeline garante que as mudanças na infraestrutura sejam testadas e aplicadas de forma consistente e segura.
