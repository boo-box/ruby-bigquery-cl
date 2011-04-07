require 'spec_helper'

describe "Query" do

  it "should execute query" do
    http_response = {"result"=>{"kind"=>"bigquery#queryResults", "fields"=>[{"id"=>"SUM(views)", "type"=>"integer"}], "rows"=>[{"f"=>[{"v"=>"3562"}]}]}}
    google_rpc    = { :params => {:q => 'query;'}, :method => 'bigquery.query'}

    BQ.should_receive(:request).with(:post, google_rpc.to_json).and_return(http_response)

    query  = BQ::Query.new
    result = query.execute('query')
    result.keys.include?('result').should be_true
  end

end 
