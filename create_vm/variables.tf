# create vm
variable "vm_name" {
  type    = string
  default = "vm-1"
}

variable "vm_hostname" {
  type    = string
  default = "vm-1"

}

variable "zone" {
  type    = string
  default = "ru-central1-b"

}

# resources
variable "cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 1 # GB
}

variable "core_fraction" {
  type    = number
  default = 20 # %CPU

}

# boot disk
variable "image_id" {
  type    = string
  default = "fd8kdq6d0p8sij7h5qe3" # image_id OS (https://cloud.yandex.ru/marketplace)
}

variable "size" {
  type    = number
  default = 20 # GB
}

# create network
variable "name_network" {
  type    = string
  default = "my-network"
}

# create subnet
variable "name_subnet" {
  type    = string
  default = "my-subnet"
}

variable "v4_cidr_blocks" {
  type    = string
  default = "192.168.1.0/24"
}

variable "ip_address" {
  type    = string
  default = "192.168.1.10"
}

variable "nat" {
  type    = bool
  default = true # enable public ip
}

# metadata (ssh-connections)
variable "serial-port-enable" {
    type    = number
    default = 1     # 1 = on serial console | 0 - off serial console  
}