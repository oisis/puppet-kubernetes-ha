# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Author
# OiSiS (https://github.com/oisis/)
#
class profiles::kubernetes (
  $k8s_gui = hiera('progiles::kubernetes::k8s_gui'),
){
  include ::kubernetes

  if $k8s_gui == 'true'{
    create_resources(package, hiera('k8s_frontend', {}))
    service { 'cockpit':
      ensure => 'running',
      require => Package['cockpit'],
    }
  }
}
