resource "google_compute_network" "luan-vpc-1" {
  name = var.luan-vpc-1
  auto_create_subnetworks = false
}

resource "google_compute_network" "luan-vpc-2" {
  name = var.luan-vpc-2
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "subnet-sp" {
  name = var.subnet-sp
 ip_cidr_range = var.ip-cidr-range-sp
  region = var.region-america-latina-sp
  network = google_compute_network.luan-vpc-1.id
}

resource "google_compute_subnetwork" "subnet-chile" {
  name = var.subnet-chile
 ip_cidr_range = var.ip-cidr-range-chile
  region = var.region-america-latina-chile
  network = google_compute_network.luan-vpc-1.id
}

resource "google_compute_subnetwork" "subnet-iowa" {
  name = var.subnet-iowa
 ip_cidr_range = var.ip-cidr-range-iowa
  region = var.region-iowa
  network = google_compute_network.luan-vpc-2.id
}

resource "google_compute_subnetwork" "subnet-europe" {
  name = var.subnet-europe
 ip_cidr_range = var.ip-cidr-range-europe
  region = var.region-europe
  network = google_compute_network.luan-vpc-2.id
}

resource "google_compute_network_peering" "vpc1_to_vpc2" {
  depends_on = [ var.luan-vpc-1, var.luan-vpc-2 ]
  name                  = "vpc1-to-vpc2"
  network               = google_compute_network.luan-vpc-1.self_link
  peer_network          = google_compute_network.luan-vpc-2.self_link
}

resource "google_compute_network_peering" "vpc2_to_vpc1" {
  depends_on = [ var.luan-vpc-1, var.luan-vpc-2 ]
  name                  = "vpc2-to-vpc1"
  network               = google_compute_network.luan-vpc-2.self_link
  peer_network          = google_compute_network.luan-vpc-1.self_link
}

