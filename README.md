# Terraform AWS EKS Infrastructure 🚀

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)

Este repositório contém o código para provisionar uma infraestrutura robusta de **Kubernetes (EKS)** na AWS utilizando **Terraform**. O projeto segue padrões de nível produção, com foco em modularidade, segurança via IRSA e persistência de estado.

---

## 🏗️ Arquitetura do Projeto

A infraestrutura provisionada inclui os seguintes componentes:

* **VPC Customizada:** Isolamento de rede com CIDR 10.0.0.0/16.
* **Subnets:**
    * **Públicas:** Para Internet Gateway e NAT Gateway.
    * **Privadas:** Onde reside o Cluster EKS e os Worker Nodes.
* **NAT Gateway:** Saída segura para internet para recursos em subnets privadas.
* **AWS EKS (Control Plane):** Cluster gerenciado com suporte a IAM OIDC Provider.
* **Managed Node Groups:** Instâncias EC2 auto-gerenciáveis (t3.medium).
* **EKS Managed Add-ons:** Gerenciamento de ciclo de vida do CoreDNS, VPC-CNI e Kube-Proxy.
* **Remote State:** Persistência de estado no S3 com State Locking via DynamoDB.

---

## 📁 Estrutura de Diretórios

```text
INFRA-AWS-EKS/
├── environments/
│   └── dev/
│       ├── backend.tf        # Configuração do S3 Backend e DynamoDB Lock
│       ├── kubernetes.tf     # Configuração específica do provider Kubernetes
│       ├── main.tf           # Chamada dos módulos (VPC e EKS)
│       ├── providers.tf      # Configuração do provider AWS
│       ├── terraform.tfvars  # Definição dos valores das variáveis
│       └── variables.tf      # Declaração das variáveis do ambiente
├── modules/
│   ├── eks/
│   │   ├── auth.tf           # Data sources para autenticação do cluster
│   │   ├── main.tf           # Cluster, Node Group, OIDC e Add-ons
│   │   ├── outputs.tf        # Outputs do cluster (endpoint, ca, etc.)
│   │   └── variables.tf      # Variáveis necessárias para o EKS
│   └── vpc/
│       ├── main.tf           # Recursos de rede (VPC, Subnets, NAT)
│       ├── outputs.tf        # IDs das subnets e VPC
│       └── variables.tf      # Variáveis de rede
├── .gitignore
└── README.md