module BQ

  @@config = {}

  class << self
    def setup
      yield @@config
    end

    def config
      @@config
    end

    def request(method, data, url=nil)
      results = {}

      headers  = {
        "Authorization" => "GoogleLogin auth=#{self.config[:token]}"
      }

      if method == :post
        headers["Content-Type"] = "application/json"
      end

      # URL
      if not url.nil?
        uri = URI.parse(url)
      else
        uri = URI.parse("https://www.googleapis.com/rpc")
      end

      # Google APIs
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      response = nil
      http.start do |http|
        case method
        when :post
          response = http.post(uri.path, data, headers)
        when :delete
          response = http.delete(uri.path, headers)
        when :get
          response = http.get(uri.path, data, headers)
        end
      end

      case response.class
      when Net::HTTPOK
        results = JSON.parse(response.body)
      when Net::HTTPNoContent
        results = {'result' => nil}
      else
        response.error!
      end

      return results
    end
  end

end
