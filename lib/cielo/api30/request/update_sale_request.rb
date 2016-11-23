require "cielo/api30/request/cielo_request"

module Cielo::Request
    class UpdateSaleRequest < CieloRequest
        attr_accessor :environment,
                      :type,
                      :service_tax_amount,
                      :amount

        private :environment, :type

        def initialize(type, merchant, environment)
            super(merchant)

            @environment = environment
            @type = type
        end

        def execute(payment_id)
            uri = URI.parse(@environment.api + "1/sales/" + payment_id + "/" + type)
            params = {}

            if (amount != nil)
                params["amount"] = amount
            end

            if (service_tax_amount != nil)
                params["serviceTaxAmount"] = service_tax_amount
            end

            uri.query = URI.encode_www_form(params)

            Cielo::Payment.from_json(send_request("PUT", uri))
        end
    end
end
