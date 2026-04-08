#resource "google_compute_instance" "default" {
# name         = "my-instance"
#  machine_type = "n2-standard-2"
#  zone         = "us-central1-a"

#  tags = ["foo", "bar"]

#  boot_disk {
#    initialize_params {
#      image = "debian-cloud/debian-11"
#      labels = {
#       my_label = "value"
#      }
#    }
#  }

  # Local SSD disk
#  scratch_disk {
#    interface = "NVME"
#  }

#  network_interface {
#    network    = var.vpc_id
#    subnetwork = var.subnet_id

 #   access_config {
      # Ephemeral public IP
  #  }
#  }
#}


# Variables

#variable "vpc_id" {}
#variable "subnet_id" {}




#############################################

#module "compute_instance" {
#  source  = "spacelift.io/bhaskar422/compute-instance/google"
#  version = "0.1.0"

#  name         = "my-instance-using-module"
 # machine_type = "n2-standard-2"
 # zone         = "us-central1-a"

#  vpc_id       = var.vpc_id
#  subnet_id    = var.subnet_id
#}

