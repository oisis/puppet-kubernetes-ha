# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Author
# OiSiS (https://github.com/oisis/)
#
class profiles::etcd_key (){
  exec{ 'create_etcd_entry':
    command   => "/bin/curl -X PUT -d \"value={\\\"Network\\\":\\\"10.1.0.0/16\\\",\\\"Backend\\\":{\\\"Type\\\":\\\"vxlan\\\",\\\"VNI\\\":1}}\" \"http://etcd1.example.com:2379/v2/keys/cluster.local/network/config\""
  }
}
