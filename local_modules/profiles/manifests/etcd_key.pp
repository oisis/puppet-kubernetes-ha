# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Author
# OiSiS (https://github.com/oisis/)
#
class profiles::etcd_key (){
  file{ '/root/check_etcd_key.sh':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    content => template("${module_name}/etcd_key/check_etcd_key.sh.erb"),
  } ->
  exec{ 'check_etcd_key.sh':
    command   => "/root/check_etcd_key.sh"
  }
}
