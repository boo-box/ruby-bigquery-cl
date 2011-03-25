module Boo
  module Google
    class Import

      def initialize(token)
        @token  = token
      end

      def import(table,sources)
        table.gsub!('/','%2F')

        data = {"data" => {"sources" => []}}
        sources.to_a.each do |source|
         data["data"]["sources"] << {"uri" => source}
        end

        headers  = {
          "Content-Type"  => "application/json",
          "Authorization" => "GoogleLogin auth=#{@token}"
        }

        # URL
        uri = URI.parse("https://www.googleapis.com/bigquery/v1/tables/#{table}/imports")

        # Google APIs
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        response = nil
        http.start do |http|
          response = http.post(uri.path, data.to_json, headers)
        end

        if response.class == Net::HTTPOK
          return JSON.parse(response.body)
        else
          response.error!
        end
      end

      def import_status(table,import)
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
end
