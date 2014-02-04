# This class is used to install and configure the Apache Ant tool.
#
# ==Parameters
#
# [version]  The Ant version to install.
class ant($version = $ant::params::version, $install_dir = $ant::params::install_dir, $isdefault = true) inherits ant::params {
  $srcdir = $ant::params::srcdir
  wget::fetch { "ant-${version}":
    source      =>  "http://archive.apache.org/dist/ant/binaries/apache-ant-${version}-bin.tar.gz",
    destination => "${srcdir}/apache-ant-${version}-bin.tar.gz"
  } ->
  exec { "unpack-ant-${version}":
    command => "tar zxvf ${srcdir}/apache-ant-${version}-bin.tar.gz",
    cwd     => "${install_dir}",
    creates => "${install_dir}/apache-ant-${version}",
    path    => '/bin/:/usr/bin',
  }
  
  if ($isdefault) {
	  file { '/usr/bin/ant':
	    ensure => link,
	    target => "${install_dir}/apache-ant-${version}/bin/ant",
	    require => Exec["unpack-ant-${version}"]
	  }
  }
}