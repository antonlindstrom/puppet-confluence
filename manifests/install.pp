# == Class confluence::install
#
class confluence::install {
  include confluence::params
  include wget
  include java7

  $confluence_version = $confluence::version

  file { '/opt':
    ensure => directory,
  }

  wget::fetch { 'download_confluence':
    source      => "http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-${confluence_version}.tar.gz",
    destination => "/opt/atlassian-confluence-${confluence_version}.tar.gz",
    timeout     => 0,
    verbose     => false,
    require     => File['/opt'],
  }

  exec { 'extract_confluence':
    command   => "tar xzf /opt/atlassian-confluence-${confluence_version}.tar.gz",
    cwd       => '/opt',
    path      => '/usr/bin/:/bin/',
    logoutput => true,
    creates   => "/opt/atlassian-confluence-${confluence_version}",
    require   => Wget::Fetch['download_confluence'],
  }

  file { '/etc/init.d/confluence':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('confluence/confluence-init.erb'),
  }

}
