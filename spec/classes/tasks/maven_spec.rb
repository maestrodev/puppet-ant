require 'spec_helper'

describe "ant::tasks::maven" do
  
  context "default versions" do
    Puppet::Util::Log.level = :debug
      Puppet::Util::Log.newdestination(:console)
    it { should contain_Wget__Fetch("maven-ant-task").with_destination("/usr/share/apache-ant-1.8.2/lib/maven-ant-tasks-2.1.3.jar") }
  end

  context "specific tasks version" do
    let(:params) { {
        :version => "2.0.0"
    } }
    it { should contain_Wget__Fetch("maven-ant-task").with_destination("/usr/share/apache-ant-1.8.2/lib/maven-ant-tasks-2.0.0.jar") }
  end

  context "specific Ant + tasks version" do
    let(:pre_condition) { %Q[
      class { 'ant::params': version => '1.7.1' }
    ] } 
    let(:params) { {
        :version => "2.0.0"
    } }
    it { should contain_Wget__Fetch("maven-ant-task").with_destination("/usr/share/apache-ant-1.7.1/lib/maven-ant-tasks-2.0.0.jar") }
  end
end