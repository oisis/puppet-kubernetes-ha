# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Author
# OiSiS (https://github.com/oisis/)
#
class roles::loadbalancer () {
  include ::profiles::base
  include ::profiles::loadbalancer

  Class['::profiles::base'] ->
  Class['::profiles::loadbalancer']
}
