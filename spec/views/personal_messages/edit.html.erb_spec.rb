require 'rails_helper'

RSpec.describe "personal_messages/edit", type: :view do
  before(:each) do
    @personal_message = assign(:personal_message, PersonalMessage.create!())
  end

  it "renders the edit personal_message form" do
    render

    assert_select "form[action=?][method=?]", personal_message_path(@personal_message), "post" do
    end
  end
end
