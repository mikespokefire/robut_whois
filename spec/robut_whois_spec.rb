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
  
  it "should return how to use the plugin when help is called" do
    plugin.usage.should eq("whois <domain> - Returns the WHOIS information for a domain")
  end

  it "returns the whois information for example.com" do
    Whois.stub!(:query).and_return("WHOIS information for example.com")
    
    plugin.handle(Time.now, "@john", "whois example.com")
    plugin.connection.replies.should include("WHOIS information for example.com")
  end

  it "returns the whois information for foo.com" do
    Whois.stub!(:query).and_return("WHOIS information for foo.com")
    
    plugin.handle(Time.now, "@john", "whois example.com")
    plugin.connection.replies.should include("WHOIS information for foo.com")
  end
  
  it "should catch a Timeout::Error" do
    Whois.stub!(:query).and_return{ raise Timeout::Error }
    
    plugin.handle(Time.now, "@john", "whois example.com")
    plugin.connection.replies.should include("Sorry @john, request timed out for example.com")
  end

  it "should catch a Whois::ServerNotFound" do
    Whois.stub!(:query).and_return{ raise Whois::ServerNotFound }
    
    plugin.handle(Time.now, "@john", "whois example.com")
    plugin.connection.replies.should include("Sorry @john, Unable to find a WHOIS server for example.com")
  end
  
end
