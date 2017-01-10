module Cielo
  module API30
    # Customer's address.
    #
    # @attr [String] street the customer's address
    # @attr [String] number the customer's address number
    # @attr [String] complement any complement of customer's address
    # @attr [String] zip_code the zip code of customer's address
    # @attr [String] city the city of customer's address
    # @attr [String] state the state of customer's address
    # @attr [String] country the country of customer's address
    class Address
      attr_accessor :street,
                    :number,
                    :complement,
                    :zip_code,
                    :city,
                    :state,
                    :country

      def to_json(*options)
        hash = as_json(*options)
        hash.reject! {|k,v| v.nil?}
        hash.to_json(*options)
      end

      def self.from_json(data)
        return if data.nil?

        address = new
        address.street = data["Street"]
        address.number = data["Number"]
        address.complement = data["Complement"]
        address.zip_code = data["ZipCode"]
        address.city = data["City"]
        address.state = data["State"]
        address.country = data["Country"]
        address
      end

      def as_json(options={})
        {
          Street: @street,
          Number: @number,
          Complement: @complement,
          ZipCode: @zip_code,
          City: @city,
          State: @state,
          Country: @country
        }
      end
    end
  end
end
