module Cielo
    class Sale
        attr_accessor :merchant_order_id,
                      :customer,
                      :payment

        def initialize(merchant_order_id)
            @merchant_order_id = merchant_order_id
        end

        def to_json(*options)
            hash = as_json(*options)
            hash.reject! {|k,v| v.nil?}
            hash.to_json(*options)
        end

        def self.from_json(data)
            if (data != nil)
                sale = Sale.new(data["MerchantOrderId"] || nil)

                sale.customer = Customer.from_json(data["Customer"] || nil)
                sale.payment = Payment.from_json(data["Payment"] || nil)

                return sale
            end
        end

        private
        def as_json(options={})
            {
                MerchantOrderId: @merchant_order_id,
                Customer: @customer,
                Payment: @payment
            }
        end
    end
end
