module Cielo
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
            if (data != nil)
                customer = Customer.new(data["Name"] || nil)

                customer.email = data["Email"] || nil
                customer.birth_date = data["BirthDate"] || nil
                customer.identity = data["Identity"] || nil
                customer.identity_type = data["IdentityType"] || nil
                customer.address = Address.from_json(data["Address"] || nil)
                customer.delivery_adress = Address.from_json(data["DeliveryAddress"] || nil)

                return customer
            end
        end

        private
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
