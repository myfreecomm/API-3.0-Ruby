require 'yaml'

module Cielo
  module API30
  # Dados relacionados ao código LR da autorização
  #
  # @attr [String] code Código LR da autorização
  # @attr [String] message Mensagem para o estabelecimento comercial
  # @attr [String] description Descrição para o estabelecimento comercial
  # @attr [String] action Ação que deve ser tomada pelo estabelecimento comercial
  # @attr [String] client_message Mensagem que pode ser exibida para cliente
  # @attr [Boolean] retryable Indica se é permitida a retentativa
  # @attr [Boolean] card_error Indica se o problema está relacionado ao cartão utilizado
  class ReturnInfo
    attr_accessor :code, :message, :description, :action, :client_message, :retryable, :card_error

    def initialize(code)
      @code = code
      attributes_set
    end

    def card_error?
      card_error
    end

    def retryable?
      retryable
    end

    private

    def attributes_set
      attributes = self.class.infos.fetch(code, default_values)
      attributes.each { |attribute, value| instance_variable_set("@#{attribute}", value) }
    end

    def default_values
      {
        "message"        => "Código #{code} não identificado",
        "description"    => "Código #{code} não identificado",
        "action"         => "Entre em contato com o Suporte Web Cielo eCommerce",
        "client_message" => "Erro inesperado",
        "retryable"      => false,
        "card_error"     => false
      }
    end

    def self.infos
      @infos ||= set_infos
    end

    def self.set_infos
      file = File.join(Cielo::API30.root_path, "cielo", "api30", "return_infos.yml")
      @infos = YAML.load_file(file)
    end
  end
end
end
