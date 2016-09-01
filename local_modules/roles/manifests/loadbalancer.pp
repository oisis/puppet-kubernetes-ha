# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Author
# OiSiS (https://github.com/oisis/)
#
class roles::loadbalancer () {
  include ::profiles::base
  include ::profiles::haproxy

  anchor {'roles::k8s_node:begin':} ->
    Class['::profiles::base']       ->
    Class['::profiles::k8s_node']   ->
  anchor {'roles::k8s_node:end':}
}
