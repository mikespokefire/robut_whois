require 'spec_helper'

describe RobutWhois do
  
  let(:connection) { Robut::ConnectionMock.new }
  let(:plugin) { RobutWhois::Plugin.new(connection) }
  
  it "should be an instance of Robut::Whois::Plugin" do
    plugin.should be_an_instance_of(RobutWhois::Plugin)
  end
  
  it "should include Robut::Plugin" do
    plugin.should be_a_kind_of(Robut::Plugin)
  end
  
end
