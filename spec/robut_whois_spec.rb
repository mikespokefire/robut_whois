require 'spec_helper'

describe RobutWhois do
  
  before(:each) do
    @connection = Robut::ConnectionMock.new
    @plugin = RobutWhois::Plugin.new(@connection)
  end
  
  it "should be an instance of Robut::Whois::Plugin" do
    @plugin.should be_an_instance_of(RobutWhois::Plugin)
  end
  
  it "should include Robut::Plugin" do
    @plugin.should be_a_kind_of(Robut::Plugin)
  end
  
end
