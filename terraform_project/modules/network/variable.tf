variable "project_name" {
  description = "project name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR"
  type        = string
}

variable "public_subnets" {
  description = "dict AZ"
  type        = map(string)
}

variable "private_app_subnets" {
  description = "dict AZ"
  type        = map(string)
}

variable "private_db_subnets" {
  description = "dict AZ"
  type        = map(string)
}
