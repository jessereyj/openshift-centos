#!/bin/bash

sudo mkdir -p /etc/origin/master/
sudo touch /etc/origin/master/htpasswd
## Default variables to use
[ ! -d openshift-ansible ] && git clone https://github.com/openshift/openshift-ansible.git -b release-3.11 --depth=1

sudo ansible-playbook -i inventory.ini openshift-ansible/playbooks/prerequisites.yml
sudo ansible-playbook -i inventory.ini openshift-ansible/playbooks/deploy_cluster.yml

sudo htpasswd -b /etc/origin/master/htpasswd jebong 214jebong123
oc adm policy add-cluster-role-to-user cluster-admin jebong
