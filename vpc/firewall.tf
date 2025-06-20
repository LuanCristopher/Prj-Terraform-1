## Firewall Rules for SSH Access
resource "google_compute_firewall" "allow_ssh_luan_vpc_1" {
  depends_on = [google_compute_network.luan_vpc_1] # Ensure correct snake_case reference
  name       = "fw-luan-vpc1-allow-ssh"            # GCP resource name
  network    = var.luan_vpc_1_name                 # Variable for network name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["192.168.60.0/27"] # Specific IP range for SSH
}

resource "google_compute_firewall" "allow_ssh_luan_vpc_2" {
  depends_on = [google_compute_network.luan_vpc_2]
  name       = "fw-luan-vpc2-allow-ssh"
  network    = var.luan_vpc_2_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["192.168.61.0/27"]
}

## Firewall Rules for ICMP Peering Traffic
# Allow ICMP from VPC1 to VPC2
resource "google_compute_firewall" "allow_icmp_egress_vpc1_to_vpc2" {
  depends_on = [google_compute_network.luan_vpc_1]
  name       = "fw-luan-vpc1-allow-icmp-egress-to-vpc2"
  network    = var.luan_vpc_1_name
  direction  = "EGRESS" # Explicitly Egress, though default for destination_ranges

  allow {
    protocol = "icmp"
  }
  source_ranges      = ["192.168.60.0/27"] # Corresponds to VPC1's subnet range part
  destination_ranges = ["192.168.61.0/27"] # Corresponds to VPC2's subnet range part
}

# Allow ICMP from VPC2 into VPC1 (Ingress)
resource "google_compute_firewall" "allow_icmp_ingress_vpc1_from_vpc2" {
  depends_on = [google_compute_network.luan_vpc_1]
  name       = "fw-luan-vpc1-allow-icmp-ingress-from-vpc2" # Was allow-icmp-from-vpc1, clarifying name
  network    = var.luan_vpc_1_name
  direction  = "INGRESS"

  allow {
    protocol = "icmp"
  }
  source_ranges = ["192.168.61.0/27"] # Traffic from VPC2
}

# Allow ICMP from VPC2 to VPC1
resource "google_compute_firewall" "allow_icmp_egress_vpc2_to_vpc1" {
  depends_on = [google_compute_network.luan_vpc_2]
  name       = "fw-luan-vpc2-allow-icmp-egress-to-vpc1" # Was allow-icmp-to-vpc1, clarifying name
  network    = var.luan_vpc_2_name
  direction  = "EGRESS"

  allow {
    protocol = "icmp"
  }
  source_ranges      = ["192.168.61.0/27"] # Corresponds to VPC2's subnet range part
  destination_ranges = ["192.168.60.0/27"] # Corresponds to VPC1's subnet range part
}

# Allow ICMP from VPC1 into VPC2 (Ingress)
resource "google_compute_firewall" "allow_icmp_ingress_vpc2_from_vpc1" {
  depends_on = [google_compute_network.luan_vpc_2]
  name       = "fw-luan-vpc2-allow-icmp-ingress-from-vpc1" # Was allow-icmp-from-vpc2, clarifying name
  network    = var.luan_vpc_2_name
  direction  = "INGRESS"

  allow {
    protocol = "icmp"
  }
  source_ranges = ["192.168.60.0/27"] # Traffic from VPC1
}

## Firewall Rules for Internal ICMP Traffic
resource "google_compute_firewall" "allow_icmp_internal_luan_vpc_1" {
  depends_on = [google_compute_network.luan_vpc_1]
  name       = "fw-luan-vpc1-allow-icmp-internal"
  network    = var.luan_vpc_1_name

  allow {
    protocol = "icmp"
  }
  source_ranges = ["192.168.60.0/27"] # Internal range for VPC1
}

resource "google_compute_firewall" "allow_icmp_internal_luan_vpc_2" {
  depends_on = [google_compute_network.luan_vpc_2]
  name       = "fw-luan-vpc2-allow-icmp-internal"
  network    = var.luan_vpc_2_name

  allow {
    protocol = "icmp"
  }
  source_ranges = ["192.168.61.0/27"] # Internal range for VPC2
}

## Firewall Rules for IAP (Identity-Aware Proxy) SSH Access
resource "google_compute_firewall" "allow_iap_ssh_luan_vpc_1" {
  depends_on = [google_compute_network.luan_vpc_1]
  name       = "fw-luan-vpc1-allow-iap-ssh"
  network    = var.luan_vpc_1_name
  direction  = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"] # Google's IAP IP range
}

resource "google_compute_firewall" "allow_iap_ssh_luan_vpc_2" {
  depends_on = [google_compute_network.luan_vpc_2]
  name       = "fw-luan-vpc2-allow-iap-ssh"
  network    = var.luan_vpc_2_name
  direction  = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["35.235.240.0/20"] # Google's IAP IP range
}