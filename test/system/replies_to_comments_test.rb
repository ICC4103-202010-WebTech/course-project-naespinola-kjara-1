require "application_system_test_case"

class RepliesToCommentsTest < ApplicationSystemTestCase
  setup do
    @replies_to_comment = replies_to_comments(:one)
  end

  test "visiting the index" do
    visit replies_to_comments_url
    assert_selector "h1", text: "Replies To Comments"
  end

  test "creating a Replies to comment" do
    visit replies_to_comments_url
    click_on "New Replies To Comment"

    click_on "Create Replies to comment"

    assert_text "Replies to comment was successfully created"
    click_on "Back"
  end

  test "updating a Replies to comment" do
    visit replies_to_comments_url
    click_on "Edit", match: :first

    click_on "Update Replies to comment"

    assert_text "Replies to comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Replies to comment" do
    visit replies_to_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Replies to comment was successfully destroyed"
  end
end
