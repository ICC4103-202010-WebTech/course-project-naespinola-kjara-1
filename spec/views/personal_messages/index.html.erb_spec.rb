require 'rails_helper'

RSpec.describe "personal_messages/index", type: :view do
  before(:each) do
    assign(:personal_messages, [
      PersonalMessage.create!(),
      PersonalMessage.create!()
    ])
  end

  it "renders a list of personal_messages" do
    render
  end
end
