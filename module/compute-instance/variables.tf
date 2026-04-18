#variable "name" {}
#variable "machine_type" {}
#variable "zone" {}

#variable "vpc_id" {}
#variable "subnet_id" {}

variable "tags" {
  default = []
}

variable "image" {
  default = "debian-cloud/debian-11"
}
