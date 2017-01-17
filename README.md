# SDK Ruby Cielo

## Principais recursos

* [x] Pagamentos por cartão de crédito.
* [x] Pagamentos recorrentes.
    * [x] Com autorização na primeira recorrência.
    * [x] Com autorização a partir da primeira recorrência.
* [x] Pagamentos por cartão de débito.
* [x] Pagamentos por boleto.
* [x] Pagamentos por transferência eletrônica.
* [x] Cancelamento de autorização.
* [x] Consulta de pagamentos.

## Limitações

Por envolver a interface de usuário da aplicação, o SDK funciona apenas como um framework para criação das transações. Nos casos onde a autorização é direta, não há limitação; mas nos casos onde é necessário a autenticação ou qualquer tipo de redirecionamento do usuário, o desenvolvedor deverá utilizar o SDK para gerar o pagamento e, com o link retornado pela Cielo, providenciar o redirecionamento do usuário.

## Instalação

`gem install cielo-api30`

## Utilizando o SDK

Para criar um pagamento simples com cartão de crédito com o SDK, basta fazer:

### Criando um pagamento com cartão de crédito

```ruby
require "cielo/api30"

# Configure seu merchant
merchant = Cielo::API30.merchant("MERCHANT-ID", "MERCHANT-KEY")

# Crie uma instância de Sale informando o ID do pagamento
sale = Cielo::API30::Sale.new("123")

# Crie uma instância de Customer informando o nome do cliente
sale.customer = Cielo::API30::Customer.new("Fulano de Tal")

# Crie uma instância de Payment informando o valor do pagamento
sale.payment = Cielo::API30::Payment.new(15700)

# Informe o tipo de pagamento que será utilizado
sale.payment.type = Cielo::API30::Payment::PAYMENTTYPE_CREDITCARD

# Crie  uma instância de Credit Card utilizando os dados de teste
sale.payment.credit_card = Cielo::API30::CreditCard.new(security_code: "123", brand: "Visa")
sale.payment.credit_card.expiration_date = "12/2018"
sale.payment.credit_card.holder = "Fulano de Tal"
sale.payment.credit_card.card_number = "0000000000000001"

# Configure o SDK com seu merchant e o ambiente apropriado para criar a venda
cielo_api = Cielo::API30.client(merchant, Cielo::API30::Environment::sandbox)

# Crie a venda na Cielo
sale = cielo_api.create_sale(sale)

# Com a venda criada, já temos o ID do pagamento, TID e demais dados retornados pela Cielo
payment_id = sale.payment.payment_id

# Com o ID do pagamento, podemos fazer sua captura, se ela não tiver sido capturada ainda
cielo_api.capture_sale(payment_id)

# E também podemos fazer seu cancelamento, se for o caso
cielo_api.cancel_sale(payment_id)
