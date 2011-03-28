require File.join(File.dirname(__FILE__), 'spec_helper')

describe "BQ" do
  it "should have config hash" do
    BQ.respond_to?(:setup).should be_true
    BQ.setup do |config|
      config.class.should == Hash
    end
  end

  it "should setup token" do
    BQ.setup do |config|
      config[:token] = 'TOKEN'
    end
    BQ.config[:token].should == 'TOKEN'
  end
end
