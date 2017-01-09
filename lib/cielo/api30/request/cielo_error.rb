module Cielo::Request
  class CieloError < StandardError
    def initialize(msg=nil)
      super
    end
  end
end
