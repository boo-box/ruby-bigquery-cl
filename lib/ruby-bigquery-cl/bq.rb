module BQ

  @@config = {}

  class << self
    def setup
      yield @@config
    end

    def config
      @@config
    end

    # This method connect to bigquery and make all API REST calls
    # to execute table management, import request, and query methods.
    def request(method, data, url=nil)
      results = {}

      headers  = {
        "Authorization" => "GoogleLogin auth=#{self.config[:token]}"
      }

      if method == :post
        headers["Content-Type"] = "application/json"
      end

      # If url is not defined use the RPC url
      if not url.nil?
        uri = URI.parse(url)
      else
        uri = URI.parse("https://www.googleapis.com/rpc")
      end

      # Create a http object (always use ssl)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      response = nil
      http.start do |http|
        case method
        when :get
          response = http.get(uri.path, headers)
        when :post
          response = http.post(uri.path, data, headers)
        when :delete
          response = http.delete(uri.path, headers)
        else
          raise NotImplementedError
        end
      end

      if response.code_type == Net::HTTPOK
        results = JSON.parse(response.body)
      elsif response.code_type == Net::HTTPNoContent
        # delete tables returns nothing
        results = {}
      else
        # otherwise raise an exception
        response.error!
      end

      return results
    end
  end
end
