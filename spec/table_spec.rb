require 'spec_helper'

describe "Table" do

  it "should permit create table" do
    fields = [
      {"type"=> "string", "id"=> "name", "mode"=> "REQUIRED"},
      {"type"=> "integer", "id"=> "age", "mode"=> "REQUIRED"},
      {"type"=> "float", "id"=> "weight", "mode"=> "REQUIRED"},
      {"type"=> "boolean", "id"=> "is_magic", "mode"=> "REQUIRED"}
    ]

    data = {
      :data => {:name => 'example_bucket/tables/my_pony_list', :fields => fields}
    }
    successful_response = {"result" => nil}
    BQ.should_receive(:request).with(:post, data.to_json, "https://www.googleapis.com/bigquery/v1/tables").and_return(successful_response) 

    result = BQ::Table.create('example_bucket/tables/my_pony_list', fields)
    result.has_key?('result').should be_true
  end

  it "should permit delete table" do
    successful_response = {"result" => nil}
    BQ.should_receive(:request).with(:delete, {}.to_json, "https://www.googleapis.com/bigquery/v1/tables/#{CGI.escape('table_name')}").and_return(successful_response) 

    result = BQ::Table.delete('table_name')
    result.has_key?('result').should be_true
  end

end 
