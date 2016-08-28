# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Authors
# OiSiS (https://github.com/oisis/)
#
class profiles::base () {

  # Ensure we have a yum repo first before we intall rpm packages
  Yumrepo <| |> -> Package <| |>

  include ::sudo
  include ::stdlib
  include ::chrony
  include ::selinux
#  include ::users
#  include ::ssh

  # get some usual helpers installed
  create_resources(package, hiera('gemlist', {}))
  create_resources(package, hiera('applist', {}))

  ### This distributes the custom fact to the host(-pluginsync) on using puppet apply
  # lint:ignore:puppet_url_without_modules
  file { $::settings::libdir:
    ensure  => directory,
    source  => 'puppet:///plugins',
    recurse => true,
    purge   => true,
    backup  => false,
    noop    => false
  }
}
