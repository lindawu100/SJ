require 'rails_helper'

RSpec.describe "Api::Deals", type: :request do
  describe "GET /api/deals" do
    let(:owner) { Wallet.create(balance: 1000) }
    let(:receiver) { Wallet.create(balance: 2000) }

    it "create transaction successfully" do
      post transaction_api_v1_wallet_path(owner.id),
        params: {
          ownerid: owner.id,
          deal: { 
            receiverid: receiver.id,
            amount: 100
          }
        }
      expect(response).to have_http_status(200)
    end

    it "amount of deal can't exceed balance" do
      post transaction_api_v1_wallet_path(owner.id),
        params: {
          ownerid: owner.id,
          deal: { 
            receiverid: receiver.id,
            amount: 2000
          }
        }
      expect(response).to have_http_status(400)
      message = JSON.parse(response.body)
      expect(message["message"]).to eq("Fail to transaction")
    end

    it "amount can't be below 0" do
      post transaction_api_v1_wallet_path(owner.id),
        params: {
          ownerid: owner.id,
          deal: { 
            receiverid: receiver.id,
            amount: -100
          }
        }
      expect(response).to have_http_status(400)
      message = JSON.parse(response.body)
      expect(message["message"]).to eq("Fail to transaction")
    end
  end
end
