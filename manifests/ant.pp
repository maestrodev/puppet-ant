class ant::ant($version = $ant::params::version) inherits ant::params {
  wget::fetch { "ant":
    source => "http://archive.apache.org/dist/ant/binaries/apache-ant-${version}-bin.tar.gz",
    destination => "${ant::params::srcdir}/apache-ant-${version}-bin.tar.gz"
  } ->
  exec { "tar zxvf ${ant::params::srcdir}/apache-ant-${version}-bin.tar.gz":
    cwd => "/usr/share/",
    creates => "/usr/share/apache-ant-${version}",
    path    => "/bin/:/usr/bin"
  } ->
  file { "/usr/bin/ant":
    ensure => "/usr/share/apache-ant-${version}/bin/ant",
  }

}
