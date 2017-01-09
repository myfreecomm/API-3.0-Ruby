require "cielo/api30/request/cielo_request"

module Cielo::Request
  class CreateSaleRequest < CieloRequest
    attr_accessor :environment
    private :environment

    def initialize(merchant, environment)
      super(merchant)
      @environment = environment
    end

    def execute(sale)
      uri = URI.join(@environment.api, "1", "sales")
      Cielo::Sale.from_json(send_request("POST", uri, sale))
    end
  end
end
