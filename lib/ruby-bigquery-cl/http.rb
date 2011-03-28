class Net::HTTP #:nodoc: all
  alias_method :old_initialize, :initialize

  # Use ssl for all http requests
  def initialize(*args)
    old_initialize(*args)
    @ssl_context = OpenSSL::SSL::SSLContext.new
    @ssl_context.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end
end
