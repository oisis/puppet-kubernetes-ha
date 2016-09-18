# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Author
# OiSiS (https://github.com/oisis/)
#
class profiles::k8s_master::namespaces (
  $k8s_namespaces = hiera_array('profiles::kubernetes::k8s_namespaces'),
  $k8s_create_namespaces  = hiera('profiles::kubernetes::k8s_create_namespaces'),
){
  validate_array($k8s_namespaces)
  define create_namespaces{
    exec { "/bin/kubectl create namespace $title":
      unless  => "/bin/kubectl get namespaces | /bin/grep $title",
      require => Service['kube-apiserver']
    }
  }

  if $k8s_create_namespaces == 'true' {
    create_namespaces { $k8s_namespaces: }
  }
}
