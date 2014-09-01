# == Class confluence::config
#
# This class is called from confluence
#
class confluence::config {
  include confluence::params

  $confluence_home    = $confluence::params::home
  $confluence_version = $confluence::version

  user { 'confluence':
    ensure => present,
    home   => $confluence_home,
  }

  file { $confluence_home:
    ensure  => directory,
    owner   => 'confluence',
    require => User['confluence'],
  }

  file { 'setenv.sh':
    ensure => present,
    path   => "/opt/atlassian-confluence-${confluence_version}/bin/setenv.sh",
    mode   => '0755',
    owner  => root,
    group  => root,
    source => 'puppet:///modules/confluence/setenv.sh',
  }

  file { 'confluence-init.properties':
    ensure  => present,
    path    => "/opt/atlassian-confluence-${confluence_version}/confluence/WEB-INF/classes/confluence-init.properties",
    mode    => '0755',
    owner   => root,
    group   => root,
    content => template('confluence/confluence-init.properties.erb'),
  }

}
