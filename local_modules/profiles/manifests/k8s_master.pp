# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Author
# OiSiS (https://github.com/oisis/)
#
class profiles::k8s_master (){
  include flannel
  include docker

  anchor { 'k8s_master::begin': } ->
  Class['::flannel']              ->
  anchor { 'k8s_master::end': }
}
