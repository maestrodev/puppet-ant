require 'spec_helper'

describe "ant::ant" do
  context "default version" do
    it { should contain_file("/usr/bin/ant").with_ensure("/usr/share/apache-ant-1.8.2/bin/ant") }
  end

  context "specific version" do
    let(:params) { {
        :version => "1.7.1"
    } }
    it { should contain_file("/usr/bin/ant").with_ensure("/usr/share/apache-ant-1.7.1/bin/ant") }
  end
end