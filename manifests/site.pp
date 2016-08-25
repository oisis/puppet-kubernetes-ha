#
# This is the global puppet manifests entrypoint
# Here are just node classifier and setting
# global vars allowed
#
# enable the Puppet 4 behavior today
#
Package {
  allow_virtual => true,
}
#
# generic host template definitions
# - include standard settings unless we know it better
#

node default {
  include "roles::${::system_role}"

  # for debug output on the puppet client
#  notify {"Notify system_role from site.pp: ${::system_role}":}
#  notify {"Notify system_profile from site.pp: ${::system_profile}":}
#  notify {"Notify environment from site.pp: ${::environment}":}
}
