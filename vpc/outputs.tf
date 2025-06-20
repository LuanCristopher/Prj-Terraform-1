output "luan_vpc_1_id" {
  description = "The ID of the first VPC network (luan_vpc_1)"
  value       = google_compute_network.luan_vpc_1.id
}

output "luan_vpc_2_id" {
  description = "The ID of the second VPC network (luan_vpc_2)"
  value       = google_compute_network.luan_vpc_2.id
}

output "subnet_sp_id" {
  description = "The ID of the Sao Paulo subnet"
  value       = google_compute_subnetwork.subnet_sp.id
}

output "subnet_chile_id" {
  description = "The ID of the Chile subnet"
  value       = google_compute_subnetwork.subnet_chile.id
}

output "subnet_iowa_id" {
  description = "The ID of the Iowa subnet"
  value       = google_compute_subnetwork.subnet_iowa.id
}

output "subnet_europe_id" {
  description = "The ID of the Europe subnet"
  value       = google_compute_subnetwork.subnet_europe.id
}