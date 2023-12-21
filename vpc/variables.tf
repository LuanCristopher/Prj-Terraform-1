#-------------------------------VPC--------------------------------------#

variable "luan-vpc-1" {
  type = string
  default = ""
}

variable "luan-vpc-2" {
  type = string
  default = ""
}

#-------------------------------subnet--------------------------------------#

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

#-------------------------------IPRange--------------------------------------#

variable "ip-cidr-range-sp" {
  type = string
  default = ""
}


variable "ip-cidr-range-chile" {
  type = string
  default = ""
}

variable "ip-cidr-range-iowa" {
  type = string
  default = ""
}

variable "ip-cidr-range-europe" {
  type = string
  default = ""
}

#-------------------------------Região--------------------------------------#

variable "region-america-latina-sp" {
  type = string
  default = "value"
}

variable "region-america-latina-chile" {
  type = string
  default = "value"
}

variable "region-iowa" {
  type = string
  default = "value"
}

variable "region-europe" {
  type = string
  default = "value"
}