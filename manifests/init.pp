# == Class: confluence
#
# Full description of class confluence here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class confluence (
  $minimum_memory = $confluence::params::minimum_memory,
  $maximum_memory = $confluence::params::maximum_memory,
  $permgen_size   = $confluence::params::permgen_size,
  $jvm_options    = undef
) inherits confluence::params {

  # validate parameters here

  anchor { 'confluence::begin': } ->
  class { 'confluence::install': } ->
  class { 'confluence::config': }
  class { 'confluence::service': } ->
  anchor { 'confluence::end': }

  Anchor['confluence::begin']  ~> Class['confluence::service']
  Class['confluence::install'] ~> Class['confluence::service']
  Class['confluence::config']  ~> Class['confluence::service']
}
