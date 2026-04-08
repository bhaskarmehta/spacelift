resource "google_compute_instance" "default" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  tags = var.tags

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

 # scratch_disk {
  #  interface = "NVME"
  #}

  network_interface {
    network    = var.vpc_id
    subnetwork = var.subnet_id

    access_config {}
  }
}
