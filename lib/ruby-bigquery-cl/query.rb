module BQ
  class Query

    def execute(sql)
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

      if response.class == Net::HTTPOK
        @result = JSON.parse(response.body)
      else
        response.error!
      end
    end

    def result
      return @result
    end

  end
end
