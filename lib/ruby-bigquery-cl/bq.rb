module BQ

  @@config = {}

  class << self
    def setup
      yield @@config
    end

    def config
      @@config
    end

    def request(method, data)
      results = {}

      headers  = {
        "Authorization" => "GoogleLogin auth=#{self.config[:token]}"
      }

      if method == :post
        headers["Content-Type"] = "application/json"
      end

      # URL
      uri = URI.parse("https://www.googleapis.com/rpc")

      # Google APIs
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      response = nil
      http.start do |http|
        response = http.post(uri.path, data, headers)
      end

      if response.class == Net::HTTPOK
        results = JSON.parse(response.body)
      else
        response.error!
      end

      return results
    end
  end

end
