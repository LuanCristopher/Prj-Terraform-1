#--------------------------VMs---------------------------#

variable "luan-vm-sp" {
  type = string
  default = "luan-vm-sp"
}

variable "luan-vm-sp2" {
    type = string
    default = "luan-vm-sp2"
}
variable "luan-vm-chile" {
    type = string
    default = "luan-vm-chile" 
}
variable "luan-vm-iowa" {
    type = string
    default = "luan-vm-iowa"  
}

variable "luan-vm-europe" {
    type = string
    default = "luan-vm-europe"  
}

#-----------------------------------zonas--------------------------------------------#

variable "zona-sp" {
    type = string
    default = "southamerica-east1-a"   
}

variable "zona-chile" {
    type = string
    default = "southamerica-west1-a"   
}

variable "zona-iowa" {
    type = string
    default = "us-central1-a"   
}

variable "zona-europe" {
    type = string
    default = "europe-central2-a"   
}

#-----------------------------------instancias configure--------------------------------------------#

variable "vm-mc-type" {
  type = string
  default = "e2-micro"
}

variable "disk-image" {
  type = string
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "size" {
  type = number
  default = 10
}

variable "tags" {
  type = string
  default = "minha-tag"
}

#-----------------------------------instancias vpc--------------------------------------------#

variable "luan-vpc-1" {
  type = string
  default = "luan-vpc-1"
}


variable "luan-vpc-2" {
  type = string
  default = "luan-vpc-2"
}

#-----------------------------------SubNets_Name--------------------------------------------#


variable "subnet-sp" {
  type = string
  default = "subnet-sp" 
}

variable "subnet-sp2" {
  type = string
  default = "subnet-sp2" 
}

variable "subnet-chile" {
  type = string
  default = "subnet-chile" 
}

variable "subnet-iowa" {
  type = string
  default = "subnet-iowa" 
}

variable "subnet-europe" {
  type = string
  default = "subnet-europe" 
}

#-------------------------------IPRange--------------------------------------#

variable "ip-cidr-range-sp" {
  type = string
  default = "192.168.60.0/28"
}

variable "ip-cidr-range-chile" {
  type = string
  default = "192.168.60.16/28"
}

variable "ip-cidr-range-iowa" {
  type = string
  default = "192.168.61.0/28"
}

variable "ip-cidr-range-europe" {
  type = string
  default = "192.168.61.16/28"
}

#-------------------------------Região--------------------------------------#

variable "region-america-latina-sp" {
  type = string
  default = "southamerica-east1"
}

variable "region-america-latina-chile" {
  type = string
  default = "southamerica-west1"
}

variable "region-iowa" {
  type = string
  default = "us-central1"
}

variable "region-europe" {
  type = string
  default = "europe-central2"
}