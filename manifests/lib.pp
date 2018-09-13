# This defined type is used to install and configure the Apache Ant libraries.
#
# ==Parameters
#
# [version]    The version of the library to install.
# [source_url] The location of the ant library jar file.
# [target]     The install destination for the ant library jar file. Defaults to '/usr/share'.
define ant::lib(
  $version,
  $source_url,
  $target = $ant::params::target,
) {

  include ant::params

  wget::fetch { "${name}-antlib":
    source      => $source_url,
    destination => "${target}/apache-ant-${ant::params::version}/lib/${name}-${version}.jar",
    require     => Class['ant'],
  }

}
