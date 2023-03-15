output "internal_ip_address_vm-web-db_0" {
  value = yandex_compute_instance.vm-web-db[0].network_interface[0].ip_address
}

output "internal_ip_address_vm-web-db_1" {
  value = yandex_compute_instance.vm-web-db[1].network_interface[0].ip_address
}


output "external_ip_address_vm-web-db_0" {
  value = yandex_compute_instance.vm-web-db[0].network_interface[0].nat_ip_address
}

output "external_ip_address_vm-web-db_1" {
  value = yandex_compute_instance.vm-web-db[1].network_interface[0].nat_ip_address
}