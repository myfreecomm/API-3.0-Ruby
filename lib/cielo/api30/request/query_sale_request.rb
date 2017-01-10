require "cielo/api30/request/cielo_request"

module Cielo
  module API30
    module Request
      class QuerySaleRequest < CieloRequest
        attr_accessor :environment
        private :environment

        def initialize(merchant, environment)
          super(merchant)
          @environment = environment
        end

        def execute(payment_id)
          uri = URI.parse([@environment.api_query, "1", "sales", payment_id].join("/"))
          Cielo::API30::Sale.from_json(send_request("GET", uri))
        end
      end
    end
  end
end
