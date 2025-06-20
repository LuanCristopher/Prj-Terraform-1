resource "google_compute_network" "luan_vpc_1" {
  name                    = var.luan_vpc_1_name
  auto_create_subnetworks = false
}

resource "google_compute_network" "luan_vpc_2" {
  name                    = var.luan_vpc_2_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_sp" {
  name          = var.subnet_sp_name
  ip_cidr_range = var.ip_cidr_range_sp
  region        = var.region_southamerica_east1
  network       = google_compute_network.luan_vpc_1.id
}

resource "google_compute_subnetwork" "subnet_chile" {
  name          = var.subnet_chile_name
  ip_cidr_range = var.ip_cidr_range_chile
  region        = var.region_southamerica_west1
  network       = google_compute_network.luan_vpc_1.id
}

resource "google_compute_subnetwork" "subnet_iowa" {
  name          = var.subnet_iowa_name
  ip_cidr_range = var.ip_cidr_range_iowa
  region        = var.region_us_central1
  network       = google_compute_network.luan_vpc_2.id
}

resource "google_compute_subnetwork" "subnet_europe" {
  name          = var.subnet_europe_name
  ip_cidr_range = var.ip_cidr_range_europe
  region        = var.region_europe_central2
  network       = google_compute_network.luan_vpc_2.id
}

resource "google_compute_network_peering" "vpc1_to_vpc2" {
  name                  = "vpc1-to-vpc2" # GCP resource name, kebab-case is conventional
  network               = google_compute_network.luan_vpc_1.self_link
  peer_network          = google_compute_network.luan_vpc_2.self_link
  # depends_on evaluated: Terraform automatically handles dependencies based on resource references.
  # The depends_on = [var.luan_vpc_1_name, var.luan_vpc_2_name] was not conventional as these are variable values, not resource identifiers.
  # Direct reference to google_compute_network.luan_vpc_1.self_link correctly establishes dependency.
}

resource "google_compute_network_peering" "vpc2_to_vpc1" {
  name                  = "vpc2-to-vpc1" # GCP resource name
  network               = google_compute_network.luan_vpc_2.self_link
  peer_network          = google_compute_network.luan_vpc_1.self_link
  # depends_on removed for the same reasons as above.
}

