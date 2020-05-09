require 'test_helper'

class RepliesToCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @replies_to_comment = replies_to_comments(:one)
  end

  test "should get index" do
    get replies_to_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_replies_to_comment_url
    assert_response :success
  end

  test "should create replies_to_comment" do
    assert_difference('RepliesToComment.count') do
      post replies_to_comments_url, params: { replies_to_comment: {  } }
    end

    assert_redirected_to replies_to_comment_url(RepliesToComment.last)
  end

  test "should show replies_to_comment" do
    get replies_to_comment_url(@replies_to_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_replies_to_comment_url(@replies_to_comment)
    assert_response :success
  end

  test "should update replies_to_comment" do
    patch replies_to_comment_url(@replies_to_comment), params: { replies_to_comment: {  } }
    assert_redirected_to replies_to_comment_url(@replies_to_comment)
  end

  test "should destroy replies_to_comment" do
    assert_difference('RepliesToComment.count', -1) do
      delete replies_to_comment_url(@replies_to_comment)
    end

    assert_redirected_to replies_to_comments_url
  end
end
