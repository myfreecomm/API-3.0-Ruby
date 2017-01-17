module Cielo
  module API30
    class Payment
      module Status
        NOT_FINISHED      = 0
        AUTHORIZED        = 1
        PAYMENT_CONFIRMED = 2
        DENIED            = 3
        VOIDED            = 10
        REFUNDED          = 11
        PENDING           = 12
        ABORTED           = 13
        SCHEDULED         = 20

        def self.success?(code)
          [
            AUTHORIZED,
            PAYMENT_CONFIRMED,
            VOIDED,
            REFUNDED,
            PENDING,
            SCHEDULED
          ].include?(code)
        end
      end
    end
  end
end
