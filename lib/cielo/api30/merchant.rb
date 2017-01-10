module Cielo
  module API30
    # Merchant identification on Cielo
    #
    # @attr [String] merchant_id the merchant identification number
    # @attr [String] merchant_key the merchant identification key
    class Merchant
      attr_accessor :merchant_id,
                    :merchant_key

      # @param merchant_id [String] the merchant identification number
      # @param merchant_key [String] the merchant identification key
      def initialize(merchant_id, merchant_key)
        @merchant_id = merchant_id
        @merchant_key = merchant_key
      end
    end
  end
end
