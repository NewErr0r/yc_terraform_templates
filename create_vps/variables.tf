variable "name_network" {
    type    = string
    default = "my_network"
}

variable "name_subnet" {
    type    = string
    default = "my_subnet"
}

variable "zone" {
    type    = string 
    default = "ru-central1-b"
}

variable "v4_cidr_blocks" {
    type    = string
    default = "192.168.1.0/24"
}

variable "name_route-table" {
    type    = string
    default = "my_route-table"
}

variable "destination_prefix" {
    type    = string
    default = "0.0.0.0/0"  
}

variable "next_hop_address" {
    type    = string
    default = "192.168.1.10"
  
}