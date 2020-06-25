require 'rails_helper'

RSpec.describe "personal_messages/new", type: :view do
  before(:each) do
    assign(:personal_message, PersonalMessage.new())
  end

  it "renders new personal_message form" do
    render

    assert_select "form[action=?][method=?]", personal_messages_path, "post" do
    end
  end
end
