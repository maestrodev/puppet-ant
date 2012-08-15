class ant::tasks::maven($version = "2.1.3") {
  include ant::params
  wget::fetch { "maven-ant-task":
     source => "http://archive.apache.org/dist/maven/binaries/maven-ant-tasks-$version.jar",
     destination => "/usr/share/apache-ant-${ant::params::version}/lib/maven-ant-tasks-$version.jar"
   }
}