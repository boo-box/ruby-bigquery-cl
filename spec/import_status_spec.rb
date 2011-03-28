require File.join(File.dirname(__FILE__), 'spec_helper')

describe "ImportStatus" do
  it "should check a tables's import status" do
    successful_return = {"data" => {"kind" => "bigquery#import","status" => "IMPORT_DONE","sources" => [{"uri" => "examplebucket/tables/pony_sourcetable.csv"}]}} 

    import_status = BQ::ImportStatus.new("examplebucket/tables/ponylist","cfa2a4b3c283d357")

    import_status.data["status"].should.equal "IMPORT_DONE"
  end
end
