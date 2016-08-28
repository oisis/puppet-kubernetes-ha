# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Author
# OiSiS (https://github.com/oisis/)
#
class roles::etcd {
  include profiles::base
  include profiles::etcd

  anchor {'roles::etcd:begin':}  ->
    Class['::profiles::base']   ->
    Class['::profiles::etcd']   ->
  anchor {'roles::etcd:end':}
}
