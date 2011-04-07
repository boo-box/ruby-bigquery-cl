require File.join(File.dirname(__FILE__), 'spec_helper')

describe "BigQuery" do
  it "should be configurable" do
    BigQuery.setup do |config|
      config.token = 'token'
    end

    BigQuery.token.should == 'token'
  end
end
