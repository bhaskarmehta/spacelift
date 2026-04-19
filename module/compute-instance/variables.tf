#variable "name" {}
#variable "machine_type" {}
#variable "zone" {}

#variable "vpc_id" {}
#variable "subnet_id" {}

variable "disks" {
  default = {
    disk1 = {
      name = "disk-1"
      zone = "us-central1-a"
      size = 11
    }
    disk2 = {
      name = "disk-2"
      zone = "us-central1-b"
      size = 12
    }
  }
}

variable "vms" {
  default = {
    vm1 = {
      name = "vm-1"
      zone = "us-central1-a"
    }
    vm2 = {
      name = "vm-2"
      zone = "us-central1-b"
    }
  }
}

variable "tags" {
  default = []
}

variable "image" {
  default = "debian-cloud/debian-11"
}
