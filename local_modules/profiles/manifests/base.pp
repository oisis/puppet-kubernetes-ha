# -*- mode: puppet -*-
# vi: set ft=puppet
#
# === Authors
# OiSiS (https://github.com/oisis/)
#
class profiles::base () {

  # First yum repo then intall rpm packages
#  Yumrepo <| |> -> Package <| |>

  include ::sudo
  include ::stdlib
  include ::chrony
  include ::selinux
#  include ::users
#  include ::ssh

  # get some usual helpers installed
  create_resources(package, hiera('gemlist', {}))
  create_resources(package, hiera('applist', {}))
}
