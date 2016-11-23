lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cielo/api30/version'

Gem::Specification.new do |spec|
  spec.name          = 'cielo-api30'
  spec.version       = Cielo::API30::VERSION
  spec.authors       = ['Cielo']
  spec.email         = ['desenvolvedores@cielo.com.br']
  spec.description   = "Integração com a API 3.0 da Cielo"
  spec.summary       = "SDK API 3.0 da Cielo"
  spec.homepage      = 'https://github.com/developercielo/API-3.0-Ruby'
  spec.license       = 'MIT'
  spec.has_rdoc      = 'yard'

  spec.required_ruby_version = '>= 2.0.0'
  spec.require_paths = ['lib']
  spec.files = ["lib/cielo/api30.rb",
                "lib/cielo/environment.rb",
                "lib/cielo/merchant.rb",
                "lib/cielo/api30/address.rb",
                "lib/cielo/api30/credit_card.rb",
                "lib/cielo/api30/customer.rb",
                "lib/cielo/api30/payment.rb",
                "lib/cielo/api30/recurrent_payment.rb",
                "lib/cielo/api30/sale.rb",
                "lib/cielo/api30/version.rb",
                "lib/cielo/api30/request/cielo_request.rb",
                "lib/cielo/api30/request/cielo_error.rb",
                "lib/cielo/api30/request/create_sale_request.rb",
                "lib/cielo/api30/request/query_sale_request.rb",
                "lib/cielo/api30/request/update_sale_request.rb"]

  spec.add_dependency "bundler", "~> 1.6"
  spec.add_dependency "uuidtools", "~> 2.1"
  spec.add_development_dependency "yard", "~> 0.8"
  spec.add_development_dependency "rspec", "~> 3.4"
end
