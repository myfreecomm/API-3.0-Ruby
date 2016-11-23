module Cielo
    class Payment
        PAYMENTTYPE_CREDITCARD = "CreditCard"
        PAYMENTTYPE_DEBITCARD = "DebitCard"
        PAYMENTTYPE_ELECTRONIC_TRANSFER = "ElectronicTransfer"
        PAYMENTTYPE_BOLETO = "Boleto"

        PROVIDER_BRADESCO = "Bradesco"
        PROVIDER_BANCO_DO_BRASIL = "BancoDoBrasil"
        PROVIDER_SIMULADO = "Simulado"

        attr_accessor :service_tax_amount,
                      :installments,
                      :interest,
                      :capture,
                      :authenticate,
                      :recurrent,
                      :recurrent_payment,
                      :credit_card,
                      :proof_of_sale,
                      :authorization_code,
                      :soft_descriptor,
                      :return_url,
                      :provider,
                      :payment_id,
                      :tid,
                      :type,
                      :amount,
                      :received_date,
                      :captured_amount,
                      :captured_date,
                      :currency,
                      :country,
                      :return_code,
                      :return_message,
                      :status,
                      :links,
                      :extra_data_collection,
                      :expiration_date,
                      :url,
                      :number,
                      :bar_code_number,
                      :digitable_line,
                      :address

        def initialize(amount, installments: 1)
            @amount = amount
            @installments = installments
        end

        def to_json(*options)
            hash = as_json(*options)
            hash.reject! {|k,v| v.nil?}
            hash.to_json(*options)
        end

        def self.from_json(data)
            if (data != nil)
                payment = Payment.new(data["Amount"] || nil)

                payment.service_tax_amount = data["ServiceTaxAmount"] || nil
                payment.installments = data["Installments"] || nil
                payment.interest = data["Interest"] || nil
                payment.capture = data["Capture"] || nil
                payment.authenticate = data["Authenticate"] || nil
                payment.recurrent = data["Recurrent"] || nil
                payment.recurrent_payment = Cielo::RecurrentPayment.from_json(data["RecurrentPayment"] || nil)
                payment.credit_card = Cielo::CreditCard.from_json(data["CreditCard"] || nil)
                payment.proof_of_sale = data["ProofOfSale"] || nil
                payment.authorization_code = data["AuthorizationCode"] || nil
                payment.soft_descriptor = data["SoftDescriptor"] || nil
                payment.return_url = data["ReturnUrl"] || nil
                payment.provider = data["Provider"] || nil
                payment.payment_id = data["PaymentId"] || nil
                payment.tid = data["Tid"] || nil
                payment.type = data["Type"] || nil
                payment.received_date = data["ReceivedDate"] || nil
                payment.captured_amount = data["CapturedAmount"] || nil
                payment.captured_date = data["CapturedDate"] || nil
                payment.currency = data["Currency"] || nil
                payment.country = data["Country"] || nil
                payment.return_code = data["ReturnCode"] || nil
                payment.return_message = data["ReturnMessage"] || nil
                payment.status = data["Status"] || nil

                payment.links = data["Links"] || nil
                payment.extra_data_collection = data["ExtraDataCollection"] || nil

                payment.expiration_date = data["ExpirationDate"] || nil
                payment.url = data["Url"] || nil
                payment.number = data["Number"] || nil
                payment.bar_code_number = data["BarCodeNumber"] || nil
                payment.digitable_line = data["DigitableLine"] || nil
                payment.address = data["Address"] || nil

                return payment
            end
        end

        private
        def as_json(options={})
            {
                ServiceTaxAmount: @service_tax_amount,
                Installments: @installments,
                Interest: @interest,
                Capture: @capture,
                Authenticate: @authenticate,
                Recurrent: @recurrent,
                RecurrentPayment: @recurrent_payment,
                CreditCard: @credit_card,
                SoftDescriptor: @soft_descriptor,
                ReturnUrl: @return_url,
                Provider: @provider,
                Type: @type,
                Amount: @amount,
                Currency: @currency,
                Country: @country,
                Number: @number,
                BarCodeNumber: @bar_code_number,
                DigitableLine: @digitable_line,
                Address: @address
          }
        end
    end
end
