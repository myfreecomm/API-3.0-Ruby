require "cielo/api30/request/cielo_request"

module Cielo::Request
  class QuerySaleRequest < CieloRequest
    attr_accessor :environment
    private :environment

    def initialize(merchant, environment)
      super(merchant)
      @environment = environment
    end

    def execute(payment_id)
      uri = URI.join(@environment.api_query, "1", "sales", payment_id)
      Cielo::Sale.from_json(send_request("GET", uri))
    end
  end
end
