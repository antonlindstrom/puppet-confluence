# == Class confluence::service
#
# This class is meant to be called from confluence
# It ensure the service is running
#
class confluence::service {
  include confluence::params

  service { $confluence::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
