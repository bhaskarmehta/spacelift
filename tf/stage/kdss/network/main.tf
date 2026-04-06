resource "google_compute_network" "vpc" {
  name = "kdss-vpc"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "kdss-subnet"
  network       = google_compute_network.vpc.id
  ip_cidr_range = "10.0.0.0/24"
}