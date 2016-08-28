# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Author
# OiSiS (https://github.com/oisis/)
#
class profiles::etcd (
  $ensure = 'present',
  $etcd_packagename = 'etcd',
  $service_ensure = 'running',
  $proxy = 'off',
  $cluster_domain,
  $cluster_network,
){
  include ::etcd
}
