module Cielo
  module API30
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
        return if data.nil?

        sale = new(data["MerchantOrderId"])
        sale.customer = Customer.from_json(data["Customer"])
        sale.payment = Payment.from_json(data["Payment"])
        sale
      end

      def as_json(options={})
        {
          MerchantOrderId: @merchant_order_id,
          Customer: @customer,
          Payment: @payment
        }
      end
    end
  end
end
