
variable "region" {
  default = "eu-central-1"
}

variable "name" {
  description = "Name of the repository."
  type        = string
}

variable "encryption_type" {
  description = "The encryption type to use for the repository. Valid values are AES256 or KMS. Defaults to AES256"
  type        = string
  default     = "AES256"
}


variable "image_tag_mutability"{
  type= string
  default = "MUTABLE"
  
}

variable "scan_on_push"{
  default = true
}


variable "tags" {
  description = "A map of key and values"
  type        = map(string)
  default = {
    Name="ecr_repo"
  }
}
