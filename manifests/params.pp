# == Class confluence::params
#
# This class is meant to be called from confluence
# It sets variables according to platform
#
class confluence::params {
  $version = '5.4'
  $home    = '/home/confluence'

  $permgen_size    = '384m'
  $minimum_memory  = '384m'
  $maximum_memory  = '1024m'

  case $::osfamily {
    'Debian': {
      $package_name = 'confluence'
      $service_name = 'confluence'
    }
    'RedHat', 'Amazon': {
      $package_name = 'confluence'
      $service_name = 'confluence'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
