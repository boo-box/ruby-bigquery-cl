require File.join(File.dirname(__FILE__), 'spec_helper')

describe "ImportStatus" do
  it "should check a tables's import status" do
    google_rpc = {
        :method => 'bigquery.imports.get',
        :params => {:table_name => 'examplebucket/tables/ponylist', :import_id => 'cfa2a4b3c283d357'}
      }
    successful_return = {"data" => {"kind" => "bigquery#import","status" => "IMPORT_DONE","sources" => [{"uri" => "examplebucket/tables/pony_sourcetable.csv"}]}} 

    # check status
    BQ.stub(:request).with(:post, google_rpc.to_json).and_return(successful_return)
    import_status = BQ::ImportStatus.new("examplebucket/tables/ponylist","cfa2a4b3c283d357")
  end
end
