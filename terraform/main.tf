terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-b"
}




resource "yandex_compute_instance" "vm-web-db" {
  name   = "vm-web-db-${count.index}"

  count = 2

  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update"
    ]
    connection {
      type = "ssh"
      user = var.yc_user
      private_key = file(var.ssh_key)
      host = self.network_interface[0].nat_ip_address
    }
  }

  boot_disk {
    initialize_params {
      image_id = "fd8kdq6d0p8sij7h5qe3"
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

  scheduling_policy {
    preemptible = true
  }
}


resource "yandex_compute_instance" "envoy" {
  name   = "envoy-name"

  resources {
    cores  = 2
    memory = 4
    core_fraction = 20
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update"
    ]
    connection {
      type = "ssh"
      user = var.yc_user
      private_key = file(var.ssh_key)
      host = self.network_interface[0].nat_ip_address
    }
  }

  boot_disk {
    initialize_params {
      image_id = "fd8kdq6d0p8sij7h5qe3"
      size     = 15
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

  scheduling_policy {
    preemptible = true
  }
}


resource "yandex_compute_instance" "observability" {
  name   = "observability-name"

  resources {
    cores  = 2
    memory = 4
    core_fraction = 20
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update"
    ]
    connection {
      type = "ssh"
      user = var.yc_user
      private_key = file(var.ssh_key)
      host = self.network_interface[0].nat_ip_address
    }
  }

  boot_disk {
    initialize_params {
      image_id = "fd8kdq6d0p8sij7h5qe3"
      size     = 15
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

  scheduling_policy {
    preemptible = true
  }
}





resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

