require File.join(File.dirname(__FILE__), 'spec_helper')
require 'ruby-debug'

describe "Query" do
  it "should execute query" do

    http_response = {"result"=>{"kind"=>"bigquery#queryResults", "fields"=>[{"id"=>"SUM(views)", "type"=>"integer"}], "rows"=>[{"f"=>[{"v"=>"3562"}]}]}}

    query = BQ::Query.new
    BQ.should_receive(:request).with(:post, "{\"method\":\"bigquery.query\",\"params\":{\"q\":\"query;\"}}").and_return(http_response)
    result = query.execute('query')
    result.keys.include?('error').should be_false
    result.keys.include?('result').should be_true
  end

  it "should raise excepton if token is invalid"
  it "should return values in Result object"

end 
