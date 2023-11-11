variable "aws_region" {
    description = "Regiao AWS"
    type = string
}

variable "id_user_pools" {
  type    = string
}

variable "client_id" {
  type    = string
}

variable "function_name" {
  type    = string
}

variable "handler" {
  type    = string
}

variable "runtime" {
  type    = string
}

variable "memory_size" {
  type    = number
}

variable "timeout" {
  type    = number
}

variable "id_conta" {
  type    = string
}

variable "secret_key_jwt" {
  type    = string
}

