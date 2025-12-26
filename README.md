# Terraform AWS EKS Infrastructure 🚀

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)

Este repositório contém o código para provisionar uma infraestrutura robusta de **Kubernetes (EKS)** na AWS utilizando **Terraform**. O projeto foi desenhado com foco em modularidade, escalabilidade e seguindo as melhores práticas de rede (VPC Segura).

---

## 🏗️ Arquitetura do Projeto

A infraestrutura provisionada inclui os seguintes componentes:

* **VPC Customizada:** Isolamento de rede com CIDR específico.
* **Subnets:**
    * **Públicas:** Para recursos que precisam de acesso externo (Internet Gateway).
    * **Privadas:** Onde o cluster EKS reside, protegidas via NAT Gateway.
* **NAT Gateway:** Permite que recursos nas subnets privadas acessem a internet (updates, patches) sem ficarem expostos.
* **AWS EKS (Control Plane):** Gerenciamento do Kubernetes com roles IAM específicas.
* **Security Groups:** Regras restritivas de tráfego.


---

## 📁 Estrutura de Diretórios

```text
terraform-aws-eks-infra/
├── modules/
│   ├── vpc/                 # Módulo para criação de rede (VPC, Subnets, IGW, NAT)
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── eks/                 # Módulo para criação do Cluster Kubernetes
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── environments/
│   └── dev/                 # Ambiente de Desenvolvimento
│       ├── main.tf          # Chamada dos módulos
│       ├── providers.tf     # Configuração dos provedores AWS e Kubernetes
│       ├── variables.tf     # Definição de variáveis
│       └── terraform.tfvars # Valores das variáveis (Ambiente Dev)
├── .gitignore               # Arquivos ignorados pelo Git
└── README.md