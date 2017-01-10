module Cielo
  module API30
    # Customer data
    #
    # @attr [String] name Customer name
    # @attr [String] email Customer email
    # @attr [String] birthDate Customer's birth date
    # @attr [String] identity Customer id
    # @attr [String] identityType The type of customer id
    # @attr [Address] address Customer's address
    # @attr [Address] deliveryAddress The delivery address
    class Customer
      attr_accessor :name,
                    :email,
                    :birth_date,
                    :identity,
                    :identity_type,
                    :address,
                    :delivery_adress

      def initialize(name)
        @name = name
      end

      def to_json(*options)
        hash = as_json(*options)
        hash.reject! {|k,v| v.nil?}
        hash.to_json(*options)
      end

      def self.from_json(data)
        return if data.nil?

        customer = new(data["Name"])
        customer.email = data["Email"]
        customer.birth_date = data["BirthDate"]
        customer.identity = data["Identity"]
        customer.identity_type = data["IdentityType"]
        customer.address = Address.from_json(data["Address"])
        customer.delivery_adress = Address.from_json(data["DeliveryAddress"])
        customer
      end

      def as_json(options={})
        {
          Name: @name,
          Email: @email,
          BirthDate: @birth_date,
          Identity: @identity,
          IdentityType: @identity_type,
          Address: @address,
          DeliveryAddress: @delivery_address
        }
      end
    end
  end
end
