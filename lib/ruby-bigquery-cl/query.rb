module Boo
  module Google
    class Query

      def initialize(token)
        @token  = token
        @result = nil
      end

      def execute_query(sql)
        # adicionando o ; no final da linha caso nao tenha sido
        sql += ";" if not sql.end_with?(';')

        headers  = {
          "Content-Type"  => "application/x-www-form-urlencoded",
          "Authorization" => "GoogleLogin auth=#{@token}"
        }

        # URL
        uri = URI.parse("https://www.googleapis.com/bigquery/v1/query?q=#{CGI.escape(sql)}")

        # Google APIs
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        response = nil
        http.start do |http|
          response = http.get(uri.path + "?" + uri.query, headers)
        end

        @result = JSON.parse(response.body)
      end

      def result
        return @result
      end

    end
  end
end
