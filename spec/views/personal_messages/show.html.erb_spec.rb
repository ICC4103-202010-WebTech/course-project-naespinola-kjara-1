require 'rails_helper'

RSpec.describe "personal_messages/show", type: :view do
  before(:each) do
    @personal_message = assign(:personal_message, PersonalMessage.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
