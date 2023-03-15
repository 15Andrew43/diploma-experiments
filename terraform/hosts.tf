# generate inventory file for Ansible
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tpl",
    {
      web_db = yandex_compute_instance.vm-web-db[*].network_interface[0].nat_ip_address #  aws_instance.kafka_processor.*.public_ip
      envoy = yandex_compute_instance.envoy.network_interface[0].nat_ip_address
    }
  )
  filename = "./hosts.txt"
}
