require 'rails_helper'

RSpec.describe "Mailboxes", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/mailbox/show"
      expect(response).to have_http_status(:success)
    end
  end

end
