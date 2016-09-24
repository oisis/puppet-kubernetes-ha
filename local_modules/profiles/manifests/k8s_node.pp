# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Author
# OiSiS (https://github.com/oisis/)
#
class profiles::k8s_node (){
  include ::profiles::flannel
  include ::profiles::docker
  include ::profiles::kubernetes
  include ::profiles::k8s_node::glusterfs

  Class['::profiles::docker']   ->
  Class['::profiles::flannel']  ->
  Class['::profiles::k8s_node::glusterfs'] ->
  Class['::profiles::kubernetes']
}
