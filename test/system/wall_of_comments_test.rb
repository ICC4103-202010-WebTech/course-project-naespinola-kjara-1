require "application_system_test_case"

class WallOfCommentsTest < ApplicationSystemTestCase
  setup do
    @wall_of_comment = wall_of_comments(:one)
  end

  test "visiting the index" do
    visit wall_of_comments_url
    assert_selector "h1", text: "Wall Of Comments"
  end

  test "creating a Wall of comment" do
    visit wall_of_comments_url
    click_on "New Wall Of Comment"

    click_on "Create Wall of comment"

    assert_text "Wall of comment was successfully created"
    click_on "Back"
  end

  test "updating a Wall of comment" do
    visit wall_of_comments_url
    click_on "Edit", match: :first

    click_on "Update Wall of comment"

    assert_text "Wall of comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Wall of comment" do
    visit wall_of_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wall of comment was successfully destroyed"
  end
end
