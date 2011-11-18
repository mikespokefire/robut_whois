require 'spec_helper'

describe RobutWhois do
  
  before(:each) do
    @connection = Robut::ConnectionMock.new
    @plugin = RobutWhois::Plugin.new(@connection)
  end
  
  it "should be an instance of Robut::Whois::Plugin" do
    @plugin.should be_a(RobutWhois::Plugin)
  end
  
  it "should include Robut::Plugin" do
    @plugin.should be_a(Robut::Plugin)
  end
  
end
