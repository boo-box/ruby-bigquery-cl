require 'spec_helper'

describe 'Manipulating Tables' do
  let(:fields) {
    [
      {"type"=> "string", "id"=> "name", "mode"=> "REQUIRED"},
      {"type"=> "integer", "id"=> "age", "mode"=> "REQUIRED"},
      {"type"=> "float", "id"=> "weight", "mode"=> "REQUIRED"},
      {"type"=> "boolean", "id"=> "is_magic", "mode"=> "REQUIRED"}
    ]
  }

  let(:example_query) { {:data => {:name => 'example_bucket/tables/my_pony_list', :fields => fields}} }
  let(:successful_response) { { :result => nil }.to_json }

  before :all do
    BigQuery.setup do |config|
      config.token = 'fake_token'
    end
  end

  it "should create table successfully" do
    stub_request(:post, 'https://www.googleapis.com/bigquery/v1/tables').to_return(:body => successful_response)

    response = BigQuery::Table.create('example_bucket/tables/my_pony_list', fields)

    response.should have_key('result')
    response['result'].should be_nil
  end

  it "should delete table successfully" do
    stub_request(:delete, %r{https://www.googleapis.com/bigquery/v1/tables/.*}).to_return(:body => successful_response)

    response = BigQuery::Table.delete('example_bucket/tables/my_pony_list')

    response.should have_key('result')
    response['result'].should be_nil
  end
end
