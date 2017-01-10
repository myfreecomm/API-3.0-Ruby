module Cielo
  module API30
    module Request
      class CieloError < StandardError
        def initialize(msg=nil)
          super
        end
      end
    end
  end
end
