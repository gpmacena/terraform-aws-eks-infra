# Terraform AWS EKS Infrastructure 🚀

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)

Este repositório provisiona uma infraestrutura de **Kubernetes (EKS)** de nível produtivo na AWS. O projeto demonstra o uso avançado de **IaC (Terraform)**, automação de **CI/CD** e integração nativa com serviços AWS para exposição de aplicações.

---

## 🏗️ Arquitetura e Diferenciais

A infraestrutura foi desenhada seguindo o **AWS Well-Architected Framework**:

* **Rede de Alta Disponibilidade:** VPC com subnets públicas/privadas em múltiplas AZs e NAT Gateways.
* **Segurança IRSA (IAM Roles for Service Accounts):** Integração OIDC que permite aos Pods assumirem roles IAM específicas, eliminando a necessidade de chaves fixas.
* **AWS Load Balancer Controller:** Provisionamento dinâmico de **Application Load Balancers (ALB)** diretamente via manifestos de Ingress.
* **GitOps & CI/CD:** Pipeline automatizado via **GitHub Actions** com estágios de aprovação manual para o ambiente de `development`.
* **Aplicação de Teste:** Deploy automatizado de um cluster Nginx escalável, exposto via Ingress para validação de ponta a ponta.



---

## 📁 Estrutura de Diretórios

```text
INFRA-AWS-EKS/
├── .github/workflows/
│   └── terraform.yml        # Pipeline CI/CD (Plan, Apply, Destroy com Aprovação)
├── environments/
│   └── dev/
│       ├── app_test.tf       # Manifestos K8s (Nginx Deployment, Service, Ingress)
│       ├── backend.tf        # Remote State no S3 + Locking no DynamoDB
│       ├── main.tf           # Orquestração de Módulos
│       ├── outputs.tf        # Exibe a URL pública do Nginx após o deploy
│       └── providers.tf      # Configuração dos provedores AWS, K8s, Helm e HTTP
├── modules/
│   ├── eks/                  # Módulo de Cluster, Managed Node Groups e IRSA
│   └── vpc/                  # Módulo de Networking e Tags para ELB
└── README.md