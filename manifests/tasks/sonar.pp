class ant::tasks::sonar($version="1.2") {
  require ant
  wget::fetch { "sonar-ant-task":
    source => "http://repository.codehaus.org/org/codehaus/sonar-plugins/sonar-ant-task/$version/sonar-ant-task-$version.jar",
    destination => "/usr/share/apache-ant-${ant::params::version}/lib/sonar-ant-task-$version.jar"
  }
}
