require "cielo/api30"
require "cielo/api30/return_info"

describe Cielo::API30::ReturnInfo do
  subject { described_class.new("14") }

  describe "#initialize" do
    it "should set the attributes based on the given code" do
      expect(subject.message).to eql("Transação não autorizada. Cartão Inválido")
      expect(subject.description).to eql("Transação não autorizada. Cartão inválido. Pode ser bloqueio do cartão no banco emissor, dados incorretos ou tentativas de testes de cartão. Use o Algoritmo de Lhum (Mod 10) para evitar transações não autorizadas por esse motivo. Consulte www.cielo.com.br/desenvolvedores para implantar o Algoritmo de Lhum.")
      expect(subject.action).to eql("Não foi possível processar a transação. reveja os dados informados e tente novamente. Se o erro persistir, entre em contato com seu banco emissor.")
      expect(subject.retryable).to eql(false)
      expect(subject.card_error).to eql(true)
    end

    it "should set the default attributes when code is not found" do
      subject = described_class.new("888")

      expect(subject.message).to eql("Código 888 não identificado")
      expect(subject.description).to eql("Código 888 não identificado")
      expect(subject.action).to eql("Entre em contato com o Suporte Web Cielo eCommerce")
      expect(subject.retryable).to eql(false)
      expect(subject.card_error).to eql(false)
    end
  end

  describe "#card_error?" do
    it "should be true when card_error attribute is true" do
      subject.card_error = true
      expect(subject.card_error?).to eql(true)
    end

    it "should be false when card_error attribute is false" do
      subject.card_error = false
      expect(subject.card_error?).to eql(false)
    end
  end

  describe "#retryable?" do
    it "should be true when retryable attribute is true" do
      subject.retryable = true
      expect(subject.retryable?).to eql(true)
    end

    it "should be false when retryable attribute is false" do
      subject.retryable = false
      expect(subject.retryable?).to eql(false)
    end
  end

  it "should never be card_error and retryable" do
    codes = described_class.infos.select { |code, values| values["card_error"] && values["retryable"] }.keys
    expect(codes).to be_empty
  end
end
