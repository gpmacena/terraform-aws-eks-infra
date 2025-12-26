variable "project_name" {
  description = "Nome base para os recursos de IAM"
  type        = string
}

variable "cluster_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}