output "luan-vpc-1" {
  value = google_compute_network.luan-vpc-1.id
}

output "luan-vpc-2" {
  value = google_compute_network.luan-vpc-2.id
}

output "subnet-sp" {
  value = google_compute_subnetwork.subnet-sp.id
}

output "subnet-chile" {
  value = google_compute_subnetwork.subnet-chile.id
}

output "subnet-iowa" {
  value = google_compute_subnetwork.subnet-iowa.id
}

output "subnet-europe" {
  value = google_compute_subnetwork.subnet-europe.id
}