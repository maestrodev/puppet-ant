class ant::ivy($version="2.2.0") {
  require ant

  wget::fetch { "ivy":
    source => "http://mirrors.gigenet.com/apache//ant/ivy/${version}/apache-ivy-${version}-bin.tar.gz",
    destination => "${ant::params::srcdir}/apache-ivy-${version}-bin.tar.gz",
    require => File[ "/usr/bin/ant" ]
  } ->
  exec { "tar zxvf ${ant::params::srcdir}/apache-ivy-${version}-bin.tar.gz":
    cwd => "/usr/share",
    path => "/bin/:/usr/bin",
    creates => "/usr/share/apache-ivy-${version}"
  } ->
  file { "/usr/share/apache-ant-${ant::params::version}/lib/ivy-${version}.jar":
    ensure => "/usr/share/apache-ivy-${version}/ivy-${version}.jar",
  }
}