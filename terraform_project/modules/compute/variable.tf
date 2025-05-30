variable "project_name" {
  type        = string
}

variable "ami_id" {
  type        = string
}

variable "vpc_id" {
  type        = string
}

variable "instance_type" {    
  type        = string
}

variable "key_name" {
  type        = string
}

variable "web_sg_id" {
  type        = string
}

variable "public_subnet_ids" {
  type        = list(string)
}

variable "min_size" {
  type        = number
}

variable "max_size" {
  type        = number
}

variable "desired_capacity" {
  type        = number
}