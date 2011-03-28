require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Query" do
  it "should execute query" do

    successful_response = {"data"=>{"kind"=>"bigquery#queryResults", "fields"=>[{"id"=>"views", "type"=>"integer"}, {"id"=>"clicks", "type"=>"integer"}]}}

    query = BQ::Query.new
    query.should_receive(:execute).with('QUERY').and_return(successful_response)
    result = query.execute('QUERY')
    
    result.keys.include?('error').should be_false
    result.keys.include?('data').should be_true
  end

  it "should raise excepton if token is invalid"
  it "should return values in Result object"

end 
