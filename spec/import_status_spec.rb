require File.join(File.dirname(__FILE__), 'spec_helper')

describe "ImportStatus" do
  it "should check a tables's import status" do
    successful_return = {"data" => {"kind" => "bigquery#import","status" => "IMPORT_DONE","sources" => [{"uri" => "examplebucket/tables/pony_sourcetable.csv"}]}} 

    table     = "examplebucket/tables/ponylist"
    import_id = "cfa2a4b3c283d357"

    # check status
    BQ.should_receive(:request).with(:post, {}, "https://www.googleapis.com/bigquery/v1/tables/#{CGI.escape(table)}/imports/#{import_id}").and_return(successful_return)
    import_status = BQ::ImportStatus.new(table,import_id)
  end
end
