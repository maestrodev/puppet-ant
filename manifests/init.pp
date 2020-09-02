# This class is used to install and configure the Apache Ant tool.
#
# ==Parameters
#
# [version]  The Ant version to install.
class ant(
  $version         = $ant::params::version,
  $srcdir          = $ant::params::srcdir,
  $checksum_verify = $ant::params::checksum_verify,
  $checksum        = $ant::params::checksum,
  $proxy_server    = $ant::params::proxy_server,
  $proxy_type      = $ant::params::proxy_type,
  
  ) inherits ant::params {
  include 'archive'

  archive { "${srcdir}/apache-ant-${version}-bin.tar.gz":
    ensure          => present,
    extract         => true,
    extract_command => 'tar zxvf %s',
    extract_path    => '/usr/share/',
    source          => "https://archive.apache.org/dist/ant/binaries/apache-ant-${version}-bin.tar.gz",
    creates         => "/usr/share/apache-ant-${version}",
    cleanup         => true,
    checksum_verify => $checksum_verify,
    checksum_type   => 'md5',
    checksum        => $checksum,
    proxy_server    => $proxy_server,
    proxy_type      => $proxy_type,
  } ->
  file { '/usr/bin/ant':
    ensure => link,
    target => "/usr/share/apache-ant-${version}/bin/ant",
  } ->
  file { '/usr/share/ant':
    ensure => link,
    target => "/usr/share/apache-ant-${version}",
  }
}
