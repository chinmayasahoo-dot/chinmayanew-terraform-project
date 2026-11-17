variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}



variable "instance_type" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "key_name" {
  type = string
}

variable "allowed_ssh_cidr" {
  type = list(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}