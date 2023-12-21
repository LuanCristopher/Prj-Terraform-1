resource "google_compute_instance" "luan-vm-sp" {
  name         = var.luan-vm-sp
  machine_type = var.vm-mc-type
  zone         = var.zona-sp

  boot_disk {
    initialize_params {
      image = var.disk-image
      size = var.size
    }
  }
  

  network_interface {
    network = var.luan-vpc-1
    subnetwork = var.subnet-sp
  }

  metadata_startup_script = "echo hi > /test.txt"

}

resource "google_compute_instance" "luan-vm-sp2" {

  name         = var.luan-vm-sp2
  machine_type = var.vm-mc-type
  zone         = var.zona-sp

  boot_disk {
    initialize_params {
      image = var.disk-image
      size = var.size
    }
  }


  network_interface {
    network = var.luan-vpc-1
    subnetwork = var.subnet-sp
  }

  metadata_startup_script = "echo hi > /test.txt"

}

resource "google_compute_instance" "luan-vm-chile" {

  name         = var.luan-vm-chile
  machine_type = var.vm-mc-type
  zone         = var.zona-chile

  boot_disk {
    initialize_params {
      image = var.disk-image
      size = var.size
    }
  }


  network_interface {
    network = var.luan-vpc-1
    subnetwork = var.subnet-chile
  }

  metadata_startup_script = "echo hi > /test.txt"
}

resource "google_compute_instance" "luan-vm-iowa" {

  name         = var.luan-vm-iowa
  machine_type = var.vm-mc-type
  zone         = var.zona-iowa

  boot_disk {
    initialize_params {
      image = var.disk-image
      size = var.size
    }
  }


  network_interface {
    network = var.luan-vpc-2
    subnetwork = var.subnet-iowa
  }

  metadata_startup_script = "echo hi > /test.txt"
}

resource "google_compute_instance" "luan-vm-europe" {

  name         = var.luan-vm-europe
  machine_type = var.vm-mc-type
  zone         = var.zona-europe

  boot_disk {
    initialize_params {
      image = var.disk-image
      size = var.size
    }
  }


  network_interface {
    network = var.luan-vpc-2
    subnetwork = var.subnet-europe
  }

  metadata_startup_script = "echo hi > /test.txt"
}

