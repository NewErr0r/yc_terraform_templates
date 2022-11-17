# create vm
resource "yandex_compute_instance" "vm" {
  name     = var.vm_name
  hostname = var.vm_hostname
  zone     = var.zone

  resources {
    cores         = var.cores
    memory        = var.memory
    core_fraction = var.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.size
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet.id
    ip_address = var.ip_address
    nat        = var.nat
  }

  # interruptible vm
  scheduling_policy {
    preemptible = true
  }

  metadata = {
    user-data = "${data.template_file.cloud_init_lin.rendered}"
    serial-port-enable  = var.serial-port-enable
  }
}

# create network
resource "yandex_vpc_network" "network" {
  name = var.name_network
}

# create subnet
resource "yandex_vpc_subnet" "subnet" {
  name           = var.name_subnet
  zone           = var.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = [var.v4_cidr_blocks]
}

# connection
data "template_file" "cloud_init_lin" {
  template = file("init/meta.yml")
   vars =  {
        ssh_key = "${chomp(tls_private_key.ssh.public_key_openssh)}"
    }
}

#Create ssh key
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = "2048"
}

resource "local_file" "private_key" {
  content         = tls_private_key.ssh.private_key_pem
  filename        = "pt_key.pem"
  file_permission = "0600"
}