require "cielo/api30"

describe Cielo::API30::Request::CieloRequest do
  let(:merchant) { Cielo::API30::Merchant.new("id", "token") }

  subject { described_class.new(merchant) }

  describe "#send_request" do
    xit "TODO: other scenarios" do
    end

    context "when not a json response" do
      it "raises a Cielo error with correct message" do
        response = double(code: 500, message: "Some error", body: "not json")
        expect_any_instance_of(Net::HTTP).to receive(:send_request).and_return(response)

        expect{
          subject.send(:send_request, :get, URI.parse("https://any-url.com"))
        }.to raise_error(
            Cielo::API30::Request::CieloError,
            "Error [ERROR] Could not parse response with status '500', message 'Some error' and body 'not json'")
      end
    end
  end
end
