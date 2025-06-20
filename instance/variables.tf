variable "luan_vm_sp" {
  description = "Name for the Sao Paulo VM"
  type        = string
  default     = null
}

variable "luan_vm_sp2" {
  description = "Name for the second Sao Paulo VM"
  type        = string
  default     = null
}
variable "luan_vm_chile" {
  description = "Name for the Chile VM"
  type        = string
  default     = null
}
variable "luan_vm_iowa" {
  description = "Name for the Iowa VM"
  type        = string
  default     = null
}

variable "luan_vm_europe" {
  description = "Name for the Europe VM"
  type        = string
  default     = null
}

## Zones Configuration
variable "zone_sp" {
  description = "Zone for Sao Paulo resources"
  type        = string
  default     = null
}

variable "zone_chile" {
  description = "Zone for Chile resources"
  type        = string
  default     = null
}

variable "zone_iowa" {
  description = "Zone for Iowa resources"
  type        = string
  default     = null
}

variable "zone_europe" {
  description = "Zone for Europe resources"
  type        = string
  default     = null
}

## Instance General Configuration
variable "vm_machine_type" {
  description = "Machine type for the VMs"
  type        = string
  default     = null
}

variable "disk_image_uri" {
  description = "Disk image URI for the VMs"
  type        = string
  default     = null
}

variable "disk_size_gb" {
  description = "Disk size in GB for the VMs"
  type        = number
  default     = null # Defaulting to null, expecting value from root module
}

variable "vm_tags" {
  description = "Tags to apply to the VMs"
  type        = list(string)
  default     = null
}

## VPC Network Information (passed from root)
variable "luan_vpc_1_name" {
  description = "Name of the first VPC network"
  type        = string
  default     = null
}

variable "luan_vpc_2_name" {
  description = "Name of the second VPC network"
  type        = string
  default     = null
}

## Subnet Information (passed from root)
variable "subnet_sp_name" {
  description = "Name of the Sao Paulo subnet"
  type        = string
  default     = null
}

variable "subnet_sp2_name" { # This variable was present, keeping it for consistency
  description = "Name of the second Sao Paulo subnet"
  type        = string
  default     = null
}

variable "subnet_chile_name" {
  description = "Name of the Chile subnet"
  type        = string
  default     = null
}

variable "subnet_iowa_name" {
  description = "Name of the Iowa subnet"
  type        = string
  default     = null
}

variable "subnet_europe_name" {
  description = "Name of the Europe subnet"
  type        = string
  default     = null
}

