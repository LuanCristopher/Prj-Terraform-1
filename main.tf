terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("../svc-study-luan/sa.json")

  project = "prj-evandro-lab"
}

module "vpc" {
  source = "./vpc"
  luan-vpc-1 = var.luan-vpc-1
  luan-vpc-2 = var.luan-vpc-2

  subnet-sp = var.subnet-sp
  subnet-sp2 = var.subnet-sp2
  subnet-chile = var.subnet-chile
  subnet-iowa = var.subnet-iowa
  subnet-europe = var.subnet-europe

  ip-cidr-range-sp = var.ip-cidr-range-sp
  ip-cidr-range-chile = var.ip-cidr-range-chile
  ip-cidr-range-iowa = var.ip-cidr-range-iowa
  ip-cidr-range-europe = var.ip-cidr-range-europe

  region-america-latina-sp = var.region-america-latina-sp
  region-america-latina-chile = var.region-america-latina-chile
  region-iowa = var.region-iowa
  region-europe = var.region-europe
  
}

module "intance" {
  depends_on = [ module.vpc ]
  source = "./instance"
  luan-vm-sp = var.luan-vm-sp
  luan-vm-sp2 = var.luan-vm-sp2
  luan-vm-chile = var.luan-vm-chile
  luan-vm-iowa = var.luan-vm-iowa
  luan-vm-europe = var.luan-vm-europe

  zona-sp = var.zona-sp
  zona-chile = var.zona-chile
  zona-iowa = var.zona-iowa
  zona-europe = var.zona-europe

  vm-mc-type = var.vm-mc-type
  disk-image = var.disk-image
  size = var.size
  tags = var.tags

  luan-vpc-1 = var.luan-vpc-1
  luan-vpc-2 = var.luan-vpc-2

  subnet-sp = var.subnet-sp
  subnet-sp2 = var.subnet-sp2
  subnet-chile = var.subnet-chile
  subnet-iowa = var.subnet-iowa
  subnet-europe = var.subnet-europe

}
