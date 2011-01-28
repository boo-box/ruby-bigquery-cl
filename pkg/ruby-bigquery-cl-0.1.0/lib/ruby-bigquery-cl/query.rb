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

        response = nil
        headers  = {
          "Content-Type"  => "application/x-www-form-urlencoded",
          "Authorization" => "GoogleLogin auth=#{@token}"
        }
        # URL
        uri = "https://www.googleapis.com/bigquery/v1/query?q=#{CGI.escape(sql)}"
        uri = URI.parse(uri)

        # Google APIs
        http_host = Net::HTTP.new(host='www.googleapis.com', port=443)
        http_host.use_ssl = true

        http_host.start do |http|
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
