provider "google" {
  project = "bhasker-492709"
  region  = "us-central1"
}
/*
import {
  to = google_compute_disk.disk
  id = "projects/bhasker-492709/zones/us-central1-a/disks/test-disk"
}
*/

import {
  to = google_compute_disk.disk["disk1"]
  id = "projects/bhasker-492709/zones/us-central1-a/disks/disk-1"
}

import {
  to = google_compute_disk.disk["disk2"]
  id = "projects/bhasker-492709/zones/us-central1-b/disks/disk-2"
}

/*
resource "google_compute_disk" "disk" {
  name = "test-disk"
  type = "pd-balanced"
  zone = "us-central1-a"
  size = 12

  labels = {
    managed_by = "spacelift"
    env        = "dev"
  }
lifecycle {
  prevent_destroy = true
}
}
*/

resource "google_compute_disk" "disk" {
  for_each = var.disks

  name = each.value.name
  zone = each.value.zone
  type = "pd-balanced"
  size = each.value.size

  lifecycle {
    prevent_destroy = true
  }
}

/*
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
    mode        = "READ_WRITE"
  }
}
*/

resource "google_compute_instance" "vm" {
  for_each = var.vms

  name         = each.value.name
  machine_type = "e2-medium"
  zone         = each.value.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  # attach disk1 only to vm1
  attached_disk {
    source = google_compute_disk.disk["disk1"].id
  }
}

#resource "google_compute_attached_disk" "attach_disk" {
#  disk = google_compute_disk.disk.id
#  instance = google_compute_instance.default.id

#  mode = "READ_WRITE"
#}
