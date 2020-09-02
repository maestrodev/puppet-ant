# This defined type is used to install and configure the Apache Ant libraries.
#
# ==Parameters
#
# [version]    The version of the library to install.
# [source_url] The location of the ant library jar file.
define ant::lib($version, $source_url) {

  include ant::params

  archive { "/usr/share/apache-ant-${ant::params::version}/lib/${name}-${version}.jar":
    ensure       => present,
    extract      => false,
    source       => $source_url,
    creates      => "/usr/share/apache-ant-${ant::params::version}/lib/${name}-${version}.jar",
    cleanup      => false,
    proxy_server => $ant::params::proxy_server,
    proxy_type   => $ant::params::proxy_type,
    require      => Class['ant'],
  }
}
