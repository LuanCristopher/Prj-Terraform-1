## GCP Project Configuration
variable "project_id" {
  description = "The ID of the Google Cloud Platform project where resources will be created. This variable must be set."
  type        = string
  default     = null # Making it explicitly null, user must provide it via .tfvars or environment variable
}

variable "gcp_region" {
  description = "The default Google Cloud Platform region for provider-level resources and where not specified by modules."
  type        = string
  default     = "us-central1" # Defaulting to us-central1 as it was hardcoded before
}

## VMs Configuration
variable "luan_vm_sp" {
  description = "Name for the Sao Paulo VM"
  type        = string
  default     = "luan-vm-sp"
}

variable "luan_vm_sp2" {
  description = "Name for the second Sao Paulo VM"
  type        = string
  default     = "luan-vm-sp2"
}
variable "luan_vm_chile" {
  description = "Name for the Chile VM"
  type        = string
  default     = "luan-vm-chile"
}
variable "luan_vm_iowa" {
  description = "Name for the Iowa VM"
  type        = string
  default     = "luan-vm-iowa"
}

variable "luan_vm_europe" {
  description = "Name for the Europe VM"
  type        = string
  default     = "luan-vm-europe"
}

## Zones Configuration
variable "zone_sp" {
  description = "Zone for Sao Paulo resources"
  type        = string
  default     = "southamerica-east1-a"
}

variable "zone_chile" {
  description = "Zone for Chile resources"
  type        = string
  default     = "southamerica-west1-a"
}

variable "zone_iowa" {
  description = "Zone for Iowa resources"
  type        = string
  default     = "us-central1-a"
}

variable "zone_europe" {
  description = "Zone for Europe resources"
  type        = string
  default     = "europe-central2-a"
}

## Instance General Configuration
variable "vm_machine_type" {
  description = "Machine type for the VMs"
  type        = string
  default     = "e2-micro"
}

variable "disk_image_uri" {
  description = "Disk image URI for the VMs"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "disk_size_gb" {
  description = "Disk size in GB for the VMs"
  type        = number
  default     = 10
}

variable "vm_tags" {
  description = "Tags to apply to the VMs"
  type        = list(string) # Changed to list(string) for better practice if multiple tags are needed
  default     = ["minha-tag"] # Defaulting to a list with one tag
}

## VPC Configuration
variable "luan_vpc_1_name" {
  description = "Name for the first VPC"
  type        = string
  default     = "luan-vpc-1"
}

variable "luan_vpc_2_name" {
  description = "Name for the second VPC"
  type        = string
  default     = "luan-vpc-2"
}

## Subnet Names Configuration
variable "subnet_sp_name" {
  description = "Name for the Sao Paulo subnet"
  type        = string
  default     = "subnet-sp"
}

variable "subnet_sp2_name" { # Assuming this might be used for a second SP subnet if needed
  description = "Name for the second Sao Paulo subnet"
  type        = string
  default     = "subnet-sp2"
}

variable "subnet_chile_name" {
  description = "Name for the Chile subnet"
  type        = string
  default     = "subnet-chile"
}

variable "subnet_iowa_name" {
  description = "Name for the Iowa subnet"
  type        = string
  default     = "subnet-iowa"
}

variable "subnet_europe_name" {
  description = "Name for the Europe subnet"
  type        = string
  default     = "subnet-europe"
}

## IP CIDR Ranges Configuration
variable "ip_cidr_range_sp" {
  description = "IP CIDR range for the Sao Paulo subnet"
  type        = string
  default     = "192.168.60.0/28"
}

variable "ip_cidr_range_chile" {
  description = "IP CIDR range for the Chile subnet"
  type        = string
  default     = "192.168.60.16/28"
}

variable "ip_cidr_range_iowa" {
  description = "IP CIDR range for the Iowa subnet"
  type        = string
  default     = "192.168.61.0/28"
}

variable "ip_cidr_range_europe" {
  description = "IP CIDR range for the Europe subnet"
  type        = string
  default     = "192.168.61.16/28"
}

## Regions Configuration
variable "region_southamerica_east1" {
  description = "Region for Sao Paulo resources (South America East 1)"
  type        = string
  default     = "southamerica-east1"
}

variable "region_southamerica_west1" {
  description = "Region for Chile resources (South America West 1)"
  type        = string
  default     = "southamerica-west1"
}

variable "region_us_central1" {
  description = "Region for Iowa resources (US Central 1)"
  type        = string
  default     = "us-central1"
}

variable "region_europe_central2" {
  description = "Region for Europe resources (Europe Central 2)"
  type        = string
  default     = "europe-central2"
}