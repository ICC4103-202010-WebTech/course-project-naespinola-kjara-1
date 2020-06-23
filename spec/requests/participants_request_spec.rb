require 'rails_helper'

RSpec.describe "Participants", type: :request do

  describe "GET /participants" do
    it "returns http success" do
      get "/participants/participants"
      expect(response).to have_http_status(:success)
    end
  end

end
