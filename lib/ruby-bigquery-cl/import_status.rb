module BQ
  class ImportStatus
    def initialize(table,import)
      table.gsub!('/','%2F')

      headers  = {
        "Authorization" => "GoogleLogin auth=#{@token}"
      }

      # URL
      uri = URI.parse("https://www.googleapis.com/bigquery/v1/tables/#{table}/imports/#{import}")

      # Google APIs
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      response = nil
      http.start do |http|
        response = http.get(uri.path, headers)
      end

      if response.class == Net::HTTPOK
        return JSON.parse(response.body)
      else
        response.error!
      end
    end
  end
end
