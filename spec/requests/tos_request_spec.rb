require 'rails_helper'

RSpec.describe "Tos", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/tos/index"
      expect(response).to have_http_status(:success)
    end
  end

end
