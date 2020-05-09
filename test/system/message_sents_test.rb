require "application_system_test_case"

class MessageSentsTest < ApplicationSystemTestCase
  setup do
    @message_sent = message_sents(:one)
  end

  test "visiting the index" do
    visit message_sents_url
    assert_selector "h1", text: "Message Sents"
  end

  test "creating a Message sent" do
    visit message_sents_url
    click_on "New Message Sent"

    click_on "Create Message sent"

    assert_text "Message sent was successfully created"
    click_on "Back"
  end

  test "updating a Message sent" do
    visit message_sents_url
    click_on "Edit", match: :first

    click_on "Update Message sent"

    assert_text "Message sent was successfully updated"
    click_on "Back"
  end

  test "destroying a Message sent" do
    visit message_sents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Message sent was successfully destroyed"
  end
end
