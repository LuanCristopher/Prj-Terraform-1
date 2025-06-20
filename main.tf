terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.gcp_region
  credentials = file("/home/runner/gcp-key.json") # For GitHub Actions
  # For local development, you might use:
  # credentials = file("path/to/your/service-account-key.json")
  # Or rely on gcloud auth application-default login
}

module "vpc" {
  source = "./vpc"

  luan_vpc_1_name = var.luan_vpc_1_name
  luan_vpc_2_name = var.luan_vpc_2_name

  subnet_sp_name     = var.subnet_sp_name
  subnet_sp2_name    = var.subnet_sp2_name
  subnet_chile_name  = var.subnet_chile_name
  subnet_iowa_name   = var.subnet_iowa_name
  subnet_europe_name = var.subnet_europe_name

  ip_cidr_range_sp     = var.ip_cidr_range_sp
  ip_cidr_range_chile  = var.ip_cidr_range_chile
  ip_cidr_range_iowa   = var.ip_cidr_range_iowa
  ip_cidr_range_europe = var.ip_cidr_range_europe

  region_southamerica_east1 = var.region_southamerica_east1
  region_southamerica_west1 = var.region_southamerica_west1
  region_us_central1        = var.region_us_central1
  region_europe_central2    = var.region_europe_central2
}

module "instance" { # Corrected spelling from "intance"
  depends_on = [module.vpc]
  source     = "./instance"

  luan_vm_sp     = var.luan_vm_sp
  luan_vm_sp2    = var.luan_vm_sp2
  luan_vm_chile  = var.luan_vm_chile
  luan_vm_iowa   = var.luan_vm_iowa
  luan_vm_europe = var.luan_vm_europe

  zone_sp     = var.zone_sp
  zone_chile  = var.zone_chile
  zone_iowa   = var.zone_iowa
  zone_europe = var.zone_europe

  vm_machine_type = var.vm_machine_type
  disk_image_uri  = var.disk_image_uri
  disk_size_gb    = var.disk_size_gb
  vm_tags         = var.vm_tags

  # Network related variables passed to instance module
  luan_vpc_1_name = var.luan_vpc_1_name
  luan_vpc_2_name = var.luan_vpc_2_name

  subnet_sp_name     = var.subnet_sp_name
  subnet_sp2_name    = var.subnet_sp2_name # Ensure this is used in instance module if intended
  subnet_chile_name  = var.subnet_chile_name
  subnet_iowa_name   = var.subnet_iowa_name
  subnet_europe_name = var.subnet_europe_name
}
