require 'spec_helper'

describe "Table" do
  let(:fields) { {} }
  let(:data) { { :data => {:name => 'bucket/tables/my_pony_list', :fields => fields} } }
  let(:successful_response) { { "result" => nil } }

  it "should create table" do
    BigQuery.should_receive(:request).
             with(:post, data.to_json, "https://www.googleapis.com/bigquery/v1/tables").
             and_return(successful_response)

    result = BigQuery::Table.create('bucket/tables/my_pony_list', fields)
    result.should have_key('result')
    result['result'].should be_nil
  end

  it "should delete table" do
    BigQuery.should_receive(:request).
             with(:delete, "{}", "https://www.googleapis.com/bigquery/v1/tables/table_name").
             and_return({})

    result = BigQuery::Table.delete('table_name')
    result.should == {}
  end
end
