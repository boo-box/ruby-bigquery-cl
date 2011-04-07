module BigQuery
  class HTTP < Net::HTTP #:nodoc: all
    # Use ssl for all http requests
    def initialize(*args)
      super(*args)

      @ssl_context = OpenSSL::SSL::SSLContext.new
      @ssl_context.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
  end
end
