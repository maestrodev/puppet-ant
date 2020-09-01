# This class is used to install and configure the Apache Ivy dependency management tool.
#
# ==Parameters
#
# [version]  The Ivy version to install.
class ant::ivy($version = '2.2.0') {
  include ant

  archive { "${ant::srcdir}/apache-ivy-${version}-bin.tar.gz":
    ensure          => present,
    extract         => true,
    extract_command => 'tar zxvf %s',
    extract_path    => '/usr/share/',
    source          => "https://archive.apache.org/dist/ant/ivy/${version}/apache-ivy-${version}-bin.tar.gz",
    creates         => "/usr/share/apache-ivy-${version}",
    cleanup         => true,
    proxy_server    => $ant::params::proxy_server,
    proxy_type      => $ant::params::proxy_type,
    require         => Class['ant'],
  } ->
  file { "/usr/share/apache-ant-${ant::version}/lib/ivy-${version}.jar":
    ensure => link,
    target => "/usr/share/apache-ivy-${version}/ivy-${version}.jar",
  }
}
