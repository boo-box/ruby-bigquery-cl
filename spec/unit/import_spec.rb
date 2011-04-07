require 'spec_helper'

describe "Import" do
  it "should import data from a single source table" do
    google_request    = "{\"data\":{\"sources\":[{\"uri\":\"examplebucket%2Ftables%2Fponylist.csv\"}]}}"
    successful_return = {"data" => {"kind" => "bigquery#import_id","table" => "examplebucket/tables/ponylist","import" => "cfa2a4b3c283d357"}}

    BQ.should_receive(:request).with(:post, google_request, "https://www.googleapis.com/bigquery/v1/tables/#{CGI.escape("examplebucket/tables/ponylist")}/imports").and_return(successful_return)
    import = BQ::Import.new("examplebucket/tables/ponylist", ["examplebucket/tables/ponylist.csv"])
  end
end
