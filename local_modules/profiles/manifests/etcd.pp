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
  # Add etcd entry if does not exist
  if $::etcd_health == 'ok' and $::etcd_key == "notfound" {
    etcd_key { "$cluster_domain":
      value   => "{ \"Network\": \"$cluster_network\", \"Backend\": { \"Type\": \"vxlan\", \"VNI\": 1 }}",
    }
  }
}
