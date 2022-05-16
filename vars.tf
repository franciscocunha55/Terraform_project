variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "region" {
  type = string
  default = "eu-west-2"
}
variable "ami" {
  type = string
}

variable "key_name"{
  type = string
  description = "Key name for SSHing into EC2"
}

variable "project" {
  type = string
  default = "Celfo_formation"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "francisco_IP" {
  type = string
  default = "89.153.193.70/32"
}