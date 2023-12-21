#----------------------------ssh--------------------------#

resource "google_compute_firewall" "allow-ssh-1" {
  depends_on = [google_compute_network.luan-vpc-1]
  name    = "allow-ssh1"
  network = var.luan-vpc-1

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

 

  source_ranges = [
    "192.168.60.0/27",
  ]  


  
}

resource "google_compute_firewall" "allow-ssh-2" {
  depends_on = [google_compute_network.luan-vpc-2]
  name    = "allow-ssh2"
  network = var.luan-vpc-2

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }



  source_ranges = [
    "192.168.61.0/27",
  ]  

  
}

#-------------------------------------icmp-peering---------------------------------------#



# VPC1 para VPC2
resource "google_compute_firewall" "allow-icmp-to-vpc2" {
  depends_on = [google_compute_network.luan-vpc-1]
  name       = "allow-icmp-to-vpc2"
  network    = var.luan-vpc-1

  allow {
    protocol = "icmp"
  }

  source_ranges      = ["192.168.60.0/27"]
  destination_ranges = ["192.168.61.0/27"]
}

resource "google_compute_firewall" "allow-icmp-from-vpc2-2" {
  depends_on = [google_compute_network.luan-vpc-1]
  name       = "allow-icmp-from-vpc1"
  network    = var.luan-vpc-1
  direction = "INGRESS"

  allow {
    protocol = "icmp"
  }

  source_ranges      = ["192.168.61.0/27"]
}

# VPC2 para VPC1
resource "google_compute_firewall" "allow-icmp-to-vpc1-2" {
  depends_on = [google_compute_network.luan-vpc-2]
  name       = "allow-icmp-to-vpc1"
  network    = var.luan-vpc-2

  allow {
    protocol = "icmp"
  }

  source_ranges      = ["192.168.61.0/27"]
  destination_ranges = ["192.168.60.0/27"]
}

resource "google_compute_firewall" "allow-icmp-from-vpc1" {
  depends_on = [google_compute_network.luan-vpc-2]
  name       = "allow-icmp-from-vpc2"
  network    = var.luan-vpc-2
  direction = "INGRESS"

  allow {
    protocol = "icmp"
  }

  source_ranges      = ["192.168.60.0/27"]
}


#-------------------------------ICMP-----------------------------#

resource "google_compute_firewall" "allow-icmp-interno" {
  depends_on = [google_compute_network.luan-vpc-1 ]
  name = "allow-icmp-interno"
  network = var.luan-vpc-1

  allow {
    protocol = "icmp"
  }

  source_ranges = ["192.168.60.0/27"]
}

resource "google_compute_firewall" "allow-icmp-interno2" {
  depends_on = [ google_compute_network.luan-vpc-2 ]
  name = "allow-icmp-interno2"
  network = var.luan-vpc-2

  allow {
    protocol = "icmp"
  }

  source_ranges = ["192.168.61.0/27"]
}




#----------------------------IAP--------------------------#

resource "google_compute_firewall" "allow-iap" {
  depends_on = [ google_compute_network.luan-vpc-1 ]
  name    = "allow-iap"
  network = var.luan-vpc-1
  direction = "INGRESS"

  allow {
    protocol = "tcp"  
    ports = ["22"]
  }
  source_ranges = ["35.235.240.0/20"]
 }

resource "google_compute_firewall" "allow-iap2" {
  depends_on = [ google_compute_network.luan-vpc-2 ]
  name    = "allow-iap2"
  network = var.luan-vpc-2
  direction = "INGRESS"

  allow {
    protocol = "tcp"  
    ports = ["22"]
  }
  source_ranges = ["35.235.240.0/20"]
 }