# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Author
# OiSiS (https://github.com/oisis/)
#
class profiles::k8s_node (){
  include ::profiles::flannel
  include ::profiles::docker

  anchor { 'k8s_node::begin': }   ->
    Class['::profiles::docker']   ->
    Class['::profiles::flannel']  ->
  anchor { 'k8s_node::end': }
}
