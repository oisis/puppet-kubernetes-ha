#!/bin/bash

FACTER=`command -v facter`
PUPPET=`command -v puppet`

if [ -z $FACTER ]; then
  echo "Puppet 3.8.X is missing, please install it"
  exit 1
fi
if [ -z $PUPPET ]; then
  echo "Puppet 3.8.X is missing, please install it"
  exit 1
fi

echo "What env do you want to provision: "
echo "Available environment is vagrant, you can setup more"
echo "by cloning directory hieradata/environment/vagrant"
read environment
export FACTER_environment=$environment
echo ""
echo "What is this system role: "
echo "Available roles are: loadbalancer, etcd, k8s_master, k8s_node"
read system_role
export FACTER_system_role=$system_role
echo ""
echo "What is this system profile: "
echo "Available profiles are: loadbalancer, etcd, k8s_master, k8s_node"
read system_profile
export FACTER_system_profile=$system_profile
echo ""
echo "Running puppet:"
$PUPPET apply --hiera_config=./hiera.yaml --modulepath=./modules ./manifests/site.pp
