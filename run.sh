#!/bin/bash

export YC_TOKEN=$(yc iam create-token)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)


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

ansible-playbook playbooks/docker.yml --forks=4

ansible-playbook playbooks/web_db.yml --forks=2
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
