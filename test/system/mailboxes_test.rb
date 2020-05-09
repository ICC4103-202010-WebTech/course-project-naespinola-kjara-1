require "application_system_test_case"

class MailboxesTest < ApplicationSystemTestCase
  setup do
    @mailbox = mailboxes(:one)
  end

  test "visiting the index" do
    visit mailboxes_url
    assert_selector "h1", text: "Mailboxes"
  end

  test "creating a Mailbox" do
    visit mailboxes_url
    click_on "New Mailbox"

    click_on "Create Mailbox"

    assert_text "Mailbox was successfully created"
    click_on "Back"
  end

  test "updating a Mailbox" do
    visit mailboxes_url
    click_on "Edit", match: :first

    click_on "Update Mailbox"

    assert_text "Mailbox was successfully updated"
    click_on "Back"
  end

  test "destroying a Mailbox" do
    visit mailboxes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mailbox was successfully destroyed"
  end
end
