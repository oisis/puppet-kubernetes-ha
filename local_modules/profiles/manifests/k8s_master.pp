# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Author
# OiSiS (https://github.com/oisis/)
#
class profiles::k8s_master (){
  include ::profiles::flannel
  include ::profiles::docker

  anchor { 'k8s_master::begin': } ->
  Class['::profiles::docker']     ->
  Class['::profiles::flannel']    ->
  anchor { 'k8s_master::end': }
}
