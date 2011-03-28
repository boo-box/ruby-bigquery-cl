module BQ
  class Import
    def initialize(table, sources)
      url = "https://www.googleapis.com/bigquery/v1/tables/#{CGI.escape(table)}/imports"

      data = {:data => {:sources => []}}
      sources.to_a.each do |source|
        data[:data][:sources] << {:uri => CGI.escape(source)}
      end

      # response from google
      result = BQ.request(:post, data.to_json, url)

      return result
    end
  end
end
