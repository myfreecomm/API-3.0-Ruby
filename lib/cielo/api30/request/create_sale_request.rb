require "cielo/api30/request/cielo_request"

module Cielo
  module API30
    module Request
      class CreateSaleRequest < CieloRequest
        attr_accessor :environment
        private :environment

        def initialize(merchant, environment)
          super(merchant)
          @environment = environment
        end

        def execute(sale)
          uri = URI.parse([@environment.api, "1", "sales"].join("/"))
          Cielo::API30::Sale.from_json(send_request("POST", uri, sale))
        end
      end
    end
  end
end
