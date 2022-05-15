variable "instance_type" {
  type = string
  default = "t3.micro"
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