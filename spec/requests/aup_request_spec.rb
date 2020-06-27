require 'rails_helper'

RSpec.describe "Aups", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/aup/index"
      expect(response).to have_http_status(:success)
    end
  end

end
