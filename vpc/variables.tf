## VPC Configuration
variable "luan_vpc_1_name" {
  description = "Name for the first VPC"
  type        = string
  default     = null
}

variable "luan_vpc_2_name" {
  description = "Name for the second VPC"
  type        = string
  default     = null
}

## Subnet Names Configuration
variable "subnet_sp_name" {
  description = "Name for the Sao Paulo subnet"
  type        = string
  default     = null
}

variable "subnet_sp2_name" { # This variable was present, keeping for consistency from root
  description = "Name for the second Sao Paulo subnet"
  type        = string
  default     = null
}

variable "subnet_chile_name" {
  description = "Name for the Chile subnet"
  type        = string
  default     = null
}

variable "subnet_iowa_name" {
  description = "Name for the Iowa subnet"
  type        = string
  default     = null
}

variable "subnet_europe_name" {
  description = "Name for the Europe subnet"
  type        = string
  default     = null
}

## IP CIDR Ranges Configuration
variable "ip_cidr_range_sp" {
  description = "IP CIDR range for the Sao Paulo subnet"
  type        = string
  default     = null
}

variable "ip_cidr_range_chile" {
  description = "IP CIDR range for the Chile subnet"
  type        = string
  default     = null
}

variable "ip_cidr_range_iowa" {
  description = "IP CIDR range for the Iowa subnet"
  type        = string
  default     = null
}

variable "ip_cidr_range_europe" {
  description = "IP CIDR range for the Europe subnet"
  type        = string
  default     = null
}

## Regions Configuration
variable "region_southamerica_east1" {
  description = "Region for Sao Paulo resources (South America East 1)"
  type        = string
  default     = null # Changed from "value"
}

variable "region_southamerica_west1" {
  description = "Region for Chile resources (South America West 1)"
  type        = string
  default     = null # Changed from "value"
}

variable "region_us_central1" {
  description = "Region for Iowa resources (US Central 1)"
  type        = string
  default     = null # Changed from "value"
}

variable "region_europe_central2" {
  description = "Region for Europe resources (Europe Central 2)"
  type        = string
  default     = null # Changed from "value"
}