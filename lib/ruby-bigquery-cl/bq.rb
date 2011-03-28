module BQ

  @@config = {}

  class << self
    def setup
      yield @@config
    end

    def config
      @@config
    end
  end

end
