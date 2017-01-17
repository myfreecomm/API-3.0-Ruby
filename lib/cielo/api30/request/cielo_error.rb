module Cielo
  module API30
    module Request
      class CieloError < StandardError
        attr_reader :code, :body

        def initialize(code, body)
          @code = code
          @body = body
          super("Error [#{code}] #{body}")
        end
      end
    end
  end
end
