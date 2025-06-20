resource "google_compute_instance" "luan_vm_sp" {
  name         = var.luan_vm_sp
  machine_type = var.vm_machine_type
  zone         = var.zone_sp
  tags         = var.vm_tags

  boot_disk {
    initialize_params {
      image = var.disk_image_uri
      size  = var.disk_size_gb
    }
  }
  
  network_interface {
    network    = var.luan_vpc_1_name # Assuming this variable provides the name of the VPC network
    subnetwork = var.subnet_sp_name  # Assuming this variable provides the name of the subnetwork
  }

  metadata_startup_script = "echo hi > /test.txt" # Placeholder startup script
}

resource "google_compute_instance" "luan_vm_sp2" {
  name         = var.luan_vm_sp2
  machine_type = var.vm_machine_type
  zone         = var.zone_sp
  tags         = var.vm_tags

  boot_disk {
    initialize_params {
      image = var.disk_image_uri
      size  = var.disk_size_gb
    }
  }

  network_interface {
    network    = var.luan_vpc_1_name
    subnetwork = var.subnet_sp_name # Note: both sp VMs are in the same subnet_sp_name by default
  }

  metadata_startup_script = "echo hi > /test.txt"
}

resource "google_compute_instance" "luan_vm_chile" {
  name         = var.luan_vm_chile
  machine_type = var.vm_machine_type
  zone         = var.zone_chile
  tags         = var.vm_tags

  boot_disk {
    initialize_params {
      image = var.disk_image_uri
      size  = var.disk_size_gb
    }
  }

  network_interface {
    network    = var.luan_vpc_1_name
    subnetwork = var.subnet_chile_name
  }

  metadata_startup_script = "echo hi > /test.txt"
}

resource "google_compute_instance" "luan_vm_iowa" {
  name         = var.luan_vm_iowa
  machine_type = var.vm_machine_type
  zone         = var.zone_iowa
  tags         = var.vm_tags

  boot_disk {
    initialize_params {
      image = var.disk_image_uri
      size  = var.disk_size_gb
    }
  }

  network_interface {
    network    = var.luan_vpc_2_name
    subnetwork = var.subnet_iowa_name
  }

  metadata_startup_script = "echo hi > /test.txt"
}

resource "google_compute_instance" "luan_vm_europe" {
  name         = var.luan_vm_europe
  machine_type = var.vm_machine_type
  zone         = var.zone_europe
  tags         = var.vm_tags

  boot_disk {
    initialize_params {
      image = var.disk_image_uri
      size  = var.disk_size_gb
    }
  }

  network_interface {
    network    = var.luan_vpc_2_name
    subnetwork = var.subnet_europe_name
  }

  metadata_startup_script = "echo hi > /test.txt"
}

