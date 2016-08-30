# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Author
# OiSiS (https://github.com/oisis/)
#
class profiles::k8s_certs () {
  file{ '/root/generate_k8s_certs.sh':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => template("${module_name}/k8s_certs/k8s_generate_certs.sh.erb"),
  } ->
  exec{ 'generate_k8s_certs':
    command => "/bin/sh /root/generate_k8s_certs.sh",
    path    => '/bin:/sbin:/usr/bin:/usr/sbin',
  }
}
