#!/bin/bash

cd terraform
terraform init
terraform apply -auto-approve

echo
echo "==================================================================="
echo "=                                                                 ="
echo "=                   instanses are created !!!                     ="
echo "=                                                                 ="
echo "==================================================================="
echo

cd ../ansible

ansible-playbook playbooks/docker.yml

ansible-playbook playbooks/web_db.yml
ansible-playbook playbooks/envoy.yml
ansible-playbook playbooks/prometheus.yml
ansible-playbook playbooks/grafana.yml

echo
echo "==================================================================="
echo "=                                                                 ="
echo "=                   playbooks are perpormed !!!                   ="
echo "=                                                                 ="
echo "==================================================================="
echo

cd ..

echo
echo "==================================================================="
echo "=                                                                 ="
echo "=                   DONE !!!                                      ="
echo "=                                                                 ="
echo "==================================================================="
echo
