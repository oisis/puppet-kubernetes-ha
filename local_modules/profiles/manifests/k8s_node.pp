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

  Class['::profiles::docker']   ->
  Class['::profiles::flannel']  ->
  Class['::profiles::kubernetes']
}
