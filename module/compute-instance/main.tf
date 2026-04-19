provider "google" {
  project = "bhasker-492709"
  region  = "us-central1"
}

resource "google_compute_disk" "disk" {
  name = "spacelift-disk"
  type = "pd-balanced"
  zone = "us-central1-a"
  size = 25

  labels = {
    managed_by = "spacelift"
    env        = "dev"
  }
}

resource "google_compute_instance" "default" {
  #name         = var.name
  #machine_type = var.machine_type
  #zone         = var.zone
  name         = "spacelift-vm-new"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

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
    #network    = var.vpc_id
    #subnetwork = var.subnet_id
    network = "default"
    access_config {}
  }

  attached_disk {
    source      = google_compute_disk.disk.id
    device_name = "spacelift-disk"
    mode        = "READ_WRITE"
  }
}

#resource "google_compute_attached_disk" "attach_disk" {
#  disk = google_compute_disk.disk.id
#  instance = google_compute_instance.default.id

#  mode = "READ_WRITE"
#}
