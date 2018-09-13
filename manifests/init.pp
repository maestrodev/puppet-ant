# This class is used to install and configure the Apache Ant tool.
#
# ==Parameters
#
# [version]  The Ant version to install.
# [target]   The destination for the Ant install. Defaults to '/usr/share'.
class ant(
  $version = $ant::params::version,
  $target  = $ant::params::target,
) inherits ant::params {
  $srcdir = $ant::params::srcdir

  case $::kernel {
    'Linux': {
      ensure_packages(['tar'])
      Package['tar'] -> Exec['unpack-ant']
    }
    default: {}
  }

  wget::fetch { 'ant':
    source      =>  "http://archive.apache.org/dist/ant/binaries/apache-ant-${version}-bin.tar.gz",
    destination => "${srcdir}/apache-ant-${version}-bin.tar.gz"
  }
  -> exec { 'unpack-ant':
    command => "tar zxvf ${srcdir}/apache-ant-${version}-bin.tar.gz",
    cwd     => $target,
    creates => "${target}/apache-ant-${version}",
    path    => '/bin/:/usr/bin',
  }
  -> file { '/usr/bin/ant':
    ensure => link,
    target => "${target}/apache-ant-${version}/bin/ant",
  }
  -> file { "${target}/ant":
    ensure => link,
    target => "${target}/apache-ant-${version}",
  }
}
