output "connect_vm" {
    value   = "ssh -i pt_key.pem yc-user@${yandex_compute_instance.vm.network_interface.0.nat_ip_address}"  
}