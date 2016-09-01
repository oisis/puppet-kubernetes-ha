# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Author
# OiSiS (https://github.com/oisis/)
#
class profiles::k8s_certs () {


  if $::generate_certs == 'true' {
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
      user    => 'root',
      onlyif  => 'test ! -f /etc/kubernetes/ssl/ca.pem',
    }
  } else {
    file{ '/etc/kubernetes/ssl/apiserver-key.pem':
      ensure  => 'file',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'puppet:///modules/profiles/k8s_certs/apiserver-keys/apiserver-key.pem',
    }
    file{ '/etc/kubernetes/ssl/apiserver.csr':
      ensure  => 'file',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'puppet:///modules/profiles/k8s_certs/apiserver-keys/apiserver.csr',
    }
    file{ '/etc/kubernetes/ssl/apiserver.pem':
      ensure  => 'file',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'puppet:///modules/profiles/k8s_certs/apiserver-keys/apiserver.pem',
    }
    file{ '/etc/kubernetes/ssl/ca-key.pem':
      ensure  => 'file',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'puppet:///modules/profiles/k8s_certs/ca-key.pem',
    }
    file{ '/etc/kubernetes/ssl/ca.pem':
      ensure  => 'file',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'puppet:///modules/profiles/k8s_certs/ca.pem',
    }
  }
}
