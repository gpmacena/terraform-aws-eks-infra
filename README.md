# Terraform AWS EKS Infrastructure

Projeto de Infraestrutura como Código (IaC) utilizando Terraform para provisionar um cluster AWS EKS pronto para produção, com arquitetura modular, múltiplos ambientes e integração com Kubernetes.

---

## Visão Geral

Este projeto demonstra a criação de uma infraestrutura Kubernetes na AWS utilizando Terraform, seguindo boas práticas de mercado, modularização e separação por ambientes.

A infraestrutura é totalmente automatizada e preparada para escalar, servindo como base para estudos, certificações e projetos profissionais.

---

## Arquitetura

- VPC customizada
- Subnets públicas e privadas
- Internet Gateway e NAT Gateway
- Cluster Kubernetes (AWS EKS)
- Node Groups com Auto Scaling
- Integração com Kubernetes Provider
- Suporte a múltiplos ambientes (dev / prod)

Diagrama da arquitetura será adicionado em breve.

---

## Tecnologias Utilizadas

- Terraform
- AWS (EKS, EC2, VPC, IAM)
- Kubernetes
- AWS CLI
- kubectl

---

## Estrutura do Projeto

terraform-aws-eks-infra/
├── modules/
│   ├── vpc/
│   └── eks/
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── providers.tf
│       ├── kubernetes.tf
│       ├── variables.tf
│       └── terraform.tfvars
└── README.md

---

## Pré-requisitos

- Terraform versão 1.3 ou superior
- AWS CLI v2 configurado
- kubectl instalado
- Conta AWS com permissões para EKS, EC2, VPC e IAM

---

## Configuração de Credenciais AWS

Configurar credenciais usando o AWS CLI:

$ aws configure

Validar credenciais:

$ aws sts get-caller-identity

---

## Como Executar

1. Inicializar o Terraform

$ cd environments/dev
$ terraform init

2. Validar o código

$ terraform validate

3. Planejar a infraestrutura

$ terraform plan

4. Aplicar a infraestrutura

$ terraform apply

5. Configurar acesso ao cluster EKS

$ aws eks update-kubeconfig --region sa-east-1 --name eks-dev

6. Validar os nodes do cluster

$ kubectl get nodes

---

## Próximas Etapas

- Deploy de aplicação no Kubernetes
- Criação de Services e Ingress
- Deploy via Helm
- Pipeline CI/CD
- Backend remoto com S3 e DynamoDB
- Políticas de segurança e governança

---

## Observações Importantes

Este projeto utiliza infraestrutura real da AWS e pode gerar custos.
Recomenda-se destruir os recursos após o uso:

$ terraform destroy

---

## Autor

Projeto desenvolvido para fins de estudo, portfólio e prática profissional com Terraform, AWS e Kubernetes.

---

## Tags

terraform aws eks kubernetes iac devops cloud
