variable "cluster_name" {
    description = "Nome do cluster"
    type = string
}

variable "aws_region" {
    description = "Regiao AWS"
    type = string
}

variable "kube_version" {
    description = "Versão do Kubernetes"
    type = string
}

variable "cluster_vpc" {}

# variable "private_subnet_1a" {}

# variable "private_subnet_1b" {}

variable "public_subnet_1a" {}

variable "public_subnet_1b" {}

variable "eks_cluster" {}

variable "eks_cluster_sg" {}

variable "nodes_instances_sizes" {
    description = "Tipo de instancia"
    type = tuple([ string ])
}

variable "auto_scale_options" {
    description = "Opções de autoscale"
    type = object({
      min = number,
      max = number,
      desired = number
    })
}