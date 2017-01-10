module Cielo
  module API30
    # API Environment URLs
    #
    # @attr [String] api API URL
    # @attr [String] apiQuery API Query URL
    class Environment
      attr_accessor :api,
                    :api_query

      def initialize(api, api_query)
        @api = api
        @api_query = api_query
      end

      # The production environment
      #
      # @return [Environment] a configured Environment for production
      def self.production
        new("https://api.cieloecommerce.cielo.com.br/", "https://apiquery.cieloecommerce.cielo.com.br/")
      end

      # The sandbox environment
      #
      # @return [Environment] a configured Environment for testing
      def self.sandbox
        new("https://apisandbox.cieloecommerce.cielo.com.br/", "https://apiquerysandbox.cieloecommerce.cielo.com.br/")
      end
    end
  end
end
