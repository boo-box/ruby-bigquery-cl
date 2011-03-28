require File.join(File.dirname(__FILE__), 'spec_helper')

describe "Import" do
  it "should import data from a single source table" do
    successful_return = {"data" => {"kind" => "bigquery#import_id","table" => "examplebucket/tables/ponylist","import" => "cfa2a4b3c283d357"}}

    import = BQ::Import.new("examplebucket/tables/ponylist", ["examplebucket/tables/ponylist.csv"])

    import.data["import"].should.equal == "cfa2a4b3c283d357"
  end
end
