module BQ

  # This class can be used to import a single CSV file into a table.
  # You should check the import status request after this call to
  # learn when the data has been imported.

  class Import
    # Import data from a single source table.
    # A hash is returned as the API response.
    def initialize(table, sources)
      # Encode destination table name
      url = "https://www.googleapis.com/bigquery/v1/tables/#{CGI.escape(table)}/imports"

      # Create hash to generate a JSON object
      data = {:data => {:sources => []}}
      sources.to_a.each do |source|
        data[:data][:sources] << {:uri => source}
      end

      # Send data import request
      @result = BQ.request(:post, data.to_json, url)
    end

    def result
      return @result
    end
  end
end
