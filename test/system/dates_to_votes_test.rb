require "application_system_test_case"

class DatesToVotesTest < ApplicationSystemTestCase
  setup do
    @dates_to_vote = dates_to_votes(:one)
  end

  test "visiting the index" do
    visit dates_to_votes_url
    assert_selector "h1", text: "Dates To Votes"
  end

  test "creating a Dates to vote" do
    visit dates_to_votes_url
    click_on "New Dates To Vote"

    click_on "Create Dates to vote"

    assert_text "Dates to vote was successfully created"
    click_on "Back"
  end

  test "updating a Dates to vote" do
    visit dates_to_votes_url
    click_on "Edit", match: :first

    click_on "Update Dates to vote"

    assert_text "Dates to vote was successfully updated"
    click_on "Back"
  end

  test "destroying a Dates to vote" do
    visit dates_to_votes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dates to vote was successfully destroyed"
  end
end
