# This class is used to install and configure the Apache Ivy dependency management tool.
#
# ==Parameters
#
# [version]  The Ivy version to install.
# [target]   The destination for the Ivy install. Defaults to '/usr/share',
class ant::ivy(
  $version = '2.2.0',
  $target  = $ant::params::target,
) {
  include ant

  wget::fetch { 'ivy':
    source      => "http://archive.apache.org/dist/ant/ivy/${version}/apache-ivy-${version}-bin.tar.gz",
    destination => "${ant::srcdir}/apache-ivy-${version}-bin.tar.gz",
    require     => Class[ant],
  }
  -> exec { 'unpack-ivy':
    command => "tar zxvf ${ant::srcdir}/apache-ivy-${version}-bin.tar.gz",
    cwd     => $target,
    path    => '/bin/:/usr/bin',
    creates => "${target}/apache-ivy-${version}"
  }
  -> file { "${target}/apache-ant-${ant::version}/lib/ivy-${version}.jar":
    ensure => link,
    target => "${target}/apache-ivy-${version}/ivy-${version}.jar",
  }
}
