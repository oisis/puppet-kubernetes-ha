# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Author
# OiSiS (https://github.com/oisis/)
#
class roles::k8s_master {
  include ::profiles::base
  include ::profiles::k8s_master

  Class['::profiles::base'] ->
  Class['::profiles::k8s_master']
}
