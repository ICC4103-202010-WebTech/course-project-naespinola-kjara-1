require 'test_helper'

class WallOfCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wall_of_comment = wall_of_comments(:one)
  end

  test "should get index" do
    get wall_of_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_wall_of_comment_url
    assert_response :success
  end

  test "should create wall_of_comment" do
    assert_difference('WallOfComment.count') do
      post wall_of_comments_url, params: { wall_of_comment: {  } }
    end

    assert_redirected_to wall_of_comment_url(WallOfComment.last)
  end

  test "should show wall_of_comment" do
    get wall_of_comment_url(@wall_of_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_wall_of_comment_url(@wall_of_comment)
    assert_response :success
  end

  test "should update wall_of_comment" do
    patch wall_of_comment_url(@wall_of_comment), params: { wall_of_comment: {  } }
    assert_redirected_to wall_of_comment_url(@wall_of_comment)
  end

  test "should destroy wall_of_comment" do
    assert_difference('WallOfComment.count', -1) do
      delete wall_of_comment_url(@wall_of_comment)
    end

    assert_redirected_to wall_of_comments_url
  end
end
