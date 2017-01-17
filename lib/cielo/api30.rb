require "cielo/api30/environment"
require "cielo/api30/merchant"
require "cielo/api30/client"

require "cielo/api30/address"
require "cielo/api30/credit_card"
require "cielo/api30/customer"
require "cielo/api30/payment"
require "cielo/api30/recurrent_payment"
require "cielo/api30/sale"

require "cielo/api30/request/create_sale_request"
require "cielo/api30/request/query_sale_request"
require "cielo/api30/request/update_sale_request"

module Cielo
  module API30
    def self.root_path
      File.dirname __dir__
    end

    def self.client(merchant, environment = nil)
      Client.new(merchant, environment)
    end

    def self.merchant(merchant_id, merchant_key)
      Merchant.new(merchant_id, merchant_key)
    end
  end
end
