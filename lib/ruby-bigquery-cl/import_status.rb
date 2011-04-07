module BigQuery

  # This class can be used check the status of an import request.

  class ImportStatus
    attr_reader :result

    # Check a table's import status
    # A hash is returned as the API response.
    def initialize(table,import_id)
      # Encode destination table name
      url = "https://www.googleapis.com/bigquery/v1/tables/#{CGI.escape(table)}/imports/#{import_id}"

      # Send data import request
      @result = BQ.request(:get, {}.to_json, url)
    end
  end
end
