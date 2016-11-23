module Cielo
    # Credit card data
    #
    # @attr [String] card_number Credit card number
    # @attr [String] holder Holder name
    # @attr [String] expiration_date Credit card expiration date
    # @attr [String] security_code Credit card security code
    # @attr [Boolean] save_card Whether or not to save the card
    # @attr [String] brand Credit card brand
    # @attr [String] card_token Card token
    class CreditCard
        attr_accessor :card_number,
                      :holder,
                      :expiration_date,
                      :security_code,
                      :save_card,
                      :brand,
                      :card_token

        def initialize(args = {})
            @security_code = args[:security_code]
            @brand = args[:brand]
            @token = args[:token]
        end

        def to_json(*options)
            hash = as_json(*options)
            hash.reject! {|k,v| v.nil?}
            hash.to_json(*options)
        end

        def self.from_json(data)
            if (data != nil)
                credit_card = CreditCard.new()
                credit_card.card_number = data["CardNumber"] || nil
                credit_card.holder = data["Holder"] || nil
                credit_card.expiration_date = data["ExpirationDate"] || nil
                credit_card.security_code = data["SecurityCode"] || nil
                credit_card.save_card = data["SaveCard"] || nil
                credit_card.brand = data["Brand"] || nil
                credit_card.card_token = data["CardToken"] || nil

                return credit_card
            end
        end

        private
        def as_json(options={})
            {
                CardNumber: @card_number,
                Holder: @holder,
                ExpirationDate: @expiration_date,
                SecurityCode: @security_code,
                SaveCard: @save_card,
                Brand: @brand,
                CardToken: @card_token
          }
        end
    end
end
