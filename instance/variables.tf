variable "luan-vm-sp" {
  type = string
  default = ""
}

variable "luan-vm-sp2" {
    type = string
    default = ""
}
variable "luan-vm-chile" {
    type = string
    default = "" 
}
variable "luan-vm-iowa" {
    type = string
    default = ""  
}

variable "luan-vm-europe" {
    type = string
    default = ""  
}

#-----------------------------------zonas--------------------------------------------#

variable "zona-sp" {
    type = string
    default = ""   
}

variable "zona-chile" {
    type = string
    default = ""   
}

variable "zona-iowa" {
    type = string
    default = ""   
}

variable "zona-europe" {
    type = string
    default = ""   
}

#-----------------------------------instancia--------------------------------------------#

variable "vm-mc-type" {
  type = string
  default = ""
}

variable "disk-image" {
  type = string
  default = ""
}

variable "size" {
  type = number
  default = 0
}

variable "tags" {
  type = string
  default = ""
}

variable "luan-vpc-1" {
  type = string
  default = ""
}


variable "luan-vpc-2" {
  type = string
  default = ""
}

#-------------------------------------subnets-name------------------------------------------#

variable "subnet-sp" {
  type = string
  default = "" 
}

variable "subnet-sp2" {
  type = string
  default = "" 
}

variable "subnet-chile" {
  type = string
  default = "" 
}

variable "subnet-iowa" {
  type = string
  default = "" 
}

variable "subnet-europe" {
  type = string
  default = "" 
}

