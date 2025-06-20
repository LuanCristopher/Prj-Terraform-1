# Módulo VPC Terraform

## Descrição

Este módulo é responsável pelo provisionamento da infraestrutura de rede fundamental na Google Cloud Platform (GCP). Ele cria e configura os seguintes recursos:

*   **Duas Redes VPC (Virtual Private Cloud):**
    *   `luan_vpc_1`: Destinada a recursos nas Américas.
    *   `luan_vpc_2`: Destinada a recursos nos EUA e Europa.
    *   Ambas as VPCs são configuradas com `auto_create_subnetworks = false` para um controle granular das sub-redes.

*   **Quatro Sub-redes:**
    *   `subnet_sp`: Localizada em `southamerica-east1` (São Paulo) dentro da `luan_vpc_1`.
    *   `subnet_chile`: Localizada em `southamerica-west1` (Chile) dentro da `luan_vpc_1`.
    *   `subnet_iowa`: Localizada em `us-central1` (Iowa) dentro da `luan_vpc_2`.
    *   `subnet_europe`: Localizada em `europe-central2` (Europa) dentro da `luan_vpc_2`.

*   **Peering entre VPCs:**
    *   Configura peering bidirecional entre `luan_vpc_1` e `luan_vpc_2`, permitindo a comunicação privada entre recursos em ambas as redes.

*   **Regras de Firewall:**
    *   **SSH:** Permite tráfego TCP na porta 22 a partir de ranges de IP específicos para cada VPC, para acesso administrativo.
        *   `fw-luan-vpc1-allow-ssh` para `luan_vpc_1`.
        *   `fw-luan-vpc2-allow-ssh` para `luan_vpc_2`.
    *   **ICMP (Peering):** Permite tráfego ICMP entre as sub-redes das VPCs pareadas para testes de conectividade.
        *   `fw-luan-vpc1-allow-icmp-egress-to-vpc2` (Saída da VPC1 para VPC2)
        *   `fw-luan-vpc1-allow-icmp-ingress-from-vpc2` (Entrada na VPC1 vinda da VPC2)
        *   `fw-luan-vpc2-allow-icmp-egress-to-vpc1` (Saída da VPC2 para VPC1)
        *   `fw-luan-vpc2-allow-icmp-ingress-from-vpc1` (Entrada na VPC2 vinda da VPC1)
    *   **ICMP (Interno):** Permite tráfego ICMP dentro de ranges específicos de cada VPC.
        *   `fw-luan-vpc1-allow-icmp-internal` para `luan_vpc_1`.
        *   `fw-luan-vpc2-allow-icmp-internal` para `luan_vpc_2`.
    *   **IAP (Identity-Aware Proxy):** Permite tráfego TCP na porta 22 a partir do range de IP do Google IAP (`35.235.240.0/20`), facilitando o acesso SSH seguro sem IPs públicos nas VMs.
        *   `fw-luan-vpc1-allow-iap-ssh` para `luan_vpc_1`.
        *   `fw-luan-vpc2-allow-iap-ssh` para `luan_vpc_2`.

## Recursos Criados

Este módulo cria os seguintes tipos de recursos Terraform:

*   `google_compute_network`
*   `google_compute_subnetwork`
*   `google_compute_firewall`
*   `google_compute_network_peering`

## Variáveis de Entrada

As seguintes variáveis de entrada são definidas para este módulo (extraídas de `vpc/variables.tf`):

| Nome                          | Descrição                                                 | Tipo     | Padrão | Obrigatório |
| ----------------------------- | --------------------------------------------------------- | -------- | ------ | ----------- |
| `luan_vpc_1_name`             | Nome para a primeira VPC                                  | `string` | `null` | Sim         |
| `luan_vpc_2_name`             | Nome para a segunda VPC                                   | `string` | `null` | Sim         |
| `subnet_sp_name`              | Nome para a sub-rede de São Paulo                         | `string` | `null` | Sim         |
| `subnet_sp2_name`             | Nome para a segunda sub-rede de São Paulo (uso futuro)    | `string` | `null` | Sim         |
| `subnet_chile_name`           | Nome para a sub-rede do Chile                             | `string` | `null` | Sim         |
| `subnet_iowa_name`            | Nome para a sub-rede de Iowa                              | `string` | `null` | Sim         |
| `subnet_europe_name`          | Nome para a sub-rede da Europa                            | `string` | `null` | Sim         |
| `ip_cidr_range_sp`            | Range CIDR IP para a sub-rede de São Paulo                | `string` | `null` | Sim         |
| `ip_cidr_range_chile`         | Range CIDR IP para a sub-rede do Chile                    | `string` | `null` | Sim         |
| `ip_cidr_range_iowa`          | Range CIDR IP para a sub-rede de Iowa                     | `string` | `null` | Sim         |
| `ip_cidr_range_europe`        | Range CIDR IP para a sub-rede da Europa                   | `string` | `null` | Sim         |
| `region_southamerica_east1`   | Região para recursos de São Paulo (South America East 1)  | `string` | `null` | Sim         |
| `region_southamerica_west1`   | Região para recursos do Chile (South America West 1)      | `string` | `null` | Sim         |
| `region_us_central1`          | Região para recursos de Iowa (US Central 1)               | `string` | `null` | Sim         |
| `region_europe_central2`      | Região para recursos da Europa (Europe Central 2)         | `string` | `null` | Sim         |

**Nota:** Como todas as variáveis têm `default = null`, elas devem ser explicitamente fornecidas pelo módulo raiz que chama este módulo VPC.

## Saídas

As seguintes saídas são fornecidas por este módulo (extraídas de `vpc/outputs.tf`):

| Nome                 | Descrição                                           |
| -------------------- | --------------------------------------------------- |
| `luan_vpc_1_id`      | O ID da primeira rede VPC (`luan_vpc_1`)            |
| `luan_vpc_2_id`      | O ID da segunda rede VPC (`luan_vpc_2`)             |
| `subnet_sp_id`       | O ID da sub-rede de São Paulo                       |
| `subnet_chile_id`    | O ID da sub-rede do Chile                           |
| `subnet_iowa_id`     | O ID da sub-rede de Iowa                            |
| `subnet_europe_id`   | O ID da sub-rede da Europa                          |
