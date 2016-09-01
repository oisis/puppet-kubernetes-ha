# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Author
# OiSiS (https://github.com/oisis/)
#
class roles::loadbalancer () {
  include ::profiles::base
  include ::profiles::haproxy

  anchor {'roles::haproxy:begin':} ->
    Class['::profiles::base']       ->
    Class['::profiles::haproxy']   ->
  anchor {'roles::haproxy:end':}
}
