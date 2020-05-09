require "application_system_test_case"

class MessageReceivedsTest < ApplicationSystemTestCase
  setup do
    @message_received = message_receiveds(:one)
  end

  test "visiting the index" do
    visit message_receiveds_url
    assert_selector "h1", text: "Message Receiveds"
  end

  test "creating a Message received" do
    visit message_receiveds_url
    click_on "New Message Received"

    click_on "Create Message received"

    assert_text "Message received was successfully created"
    click_on "Back"
  end

  test "updating a Message received" do
    visit message_receiveds_url
    click_on "Edit", match: :first

    click_on "Update Message received"

    assert_text "Message received was successfully updated"
    click_on "Back"
  end

  test "destroying a Message received" do
    visit message_receiveds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Message received was successfully destroyed"
  end
end
