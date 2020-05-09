require 'test_helper'

class DatesToVotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dates_to_vote = dates_to_votes(:one)
  end

  test "should get index" do
    get dates_to_votes_url
    assert_response :success
  end

  test "should get new" do
    get new_dates_to_vote_url
    assert_response :success
  end

  test "should create dates_to_vote" do
    assert_difference('DatesToVote.count') do
      post dates_to_votes_url, params: { dates_to_vote: {  } }
    end

    assert_redirected_to dates_to_vote_url(DatesToVote.last)
  end

  test "should show dates_to_vote" do
    get dates_to_vote_url(@dates_to_vote)
    assert_response :success
  end

  test "should get edit" do
    get edit_dates_to_vote_url(@dates_to_vote)
    assert_response :success
  end

  test "should update dates_to_vote" do
    patch dates_to_vote_url(@dates_to_vote), params: { dates_to_vote: {  } }
    assert_redirected_to dates_to_vote_url(@dates_to_vote)
  end

  test "should destroy dates_to_vote" do
    assert_difference('DatesToVote.count', -1) do
      delete dates_to_vote_url(@dates_to_vote)
    end

    assert_redirected_to dates_to_votes_url
  end
end
