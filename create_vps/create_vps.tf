# Ceate a virtual network 
resource "yandex_vpc_network" "network" {
    name    = var.name_network
}

# Create a virtual subnet 
resource "yandex_vpc_subnet" "subnet" {
    name            = var.name_subnet  
    zone            = var.zone
    network_id      = yandex_vpc_network.network.id
    route_table_id  = "${yandex_vpc_route_table.route-table.id}"
    v4_cidr_blocks  = [var.v4_cidr_blocks]
}

# Create a route table
resource "yandex_vpc_route_table" "route-table" {
    name       = var.name_route-table
    network_id = "${yandex_vpc_network.network.id}"

    static_route {
      destination_prefix = var.destination_prefix
      next_hop_address   = var.next_hop_address
    }
}