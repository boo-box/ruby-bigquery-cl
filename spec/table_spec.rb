require File.join(File.dirname(__FILE__), 'spec_helper')
require 'ruby-debug'

describe "Table" do

  it "should permit create table" do
    fields = [
      {"type"=> "string", "id"=> "name", "mode"=> "REQUIRED"},
      {"type"=> "integer", "id"=> "age", "mode"=> "REQUIRED"},
      {"type"=> "float", "id"=> "weight", "mode"=> "REQUIRED"},
      {"type"=> "boolean", "id"=> "is_magic", "mode"=> "REQUIRED"}
    ]

    data = {
      :method => 'bigquery.tables.insert',
      :data => {:name => 'example_bucket/tables/my_pony_list', :fields => fields}
    }
    successful_response = {"result" => nil}
    BQ.should_receive(:request).with(:post, data.to_json, "https://www.googleapis.com/bigquery/v1/tables").and_return(successful_response) 

    result = BQ::Table.create('example_bucket/tables/my_pony_list', fields)
    result.has_key?('result').should be_true
  end

  it "should permit delete table" do
    data = {
      :method => 'bigquery.tables.delete',
      :params => {:name => 'table_name'}
    }
    successful_response = {"result" => nil}
    BQ.should_receive(:request).with(:delete, data.to_json, "https://www.googleapis.com/bigquery/v1/tables/#{CGI.escape('table_name')}").and_return(successful_response) 

    result = BQ::Table.delete('table_name')
    result.has_key?('result').should be_true
  end

end 
