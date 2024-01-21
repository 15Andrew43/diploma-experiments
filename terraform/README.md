# Description

- terraform apply
  try to do https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart, if some errors

this terraform project does:

- create 2 instances for web-db and 1 instance for envoy
- generate hosts.txt for ansiible project [see hosts.tf]

### external vars:

- user name: ansible_master
- public key in meta.txt
- path to ssh_key
