data "google_compute_disk" "existing_disk" {
  name = "spacelift-disk"
  zone = "us-central1-a"
}

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

resource "google_compute_attached_disk" "attach_disk" {
  disk     = data.google_compute_disk.existing_disk.id
  instance = google_compute_instance.default.id

  mode = "READ_WRITE"
}
