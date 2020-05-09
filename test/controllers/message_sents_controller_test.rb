require 'test_helper'

class MessageSentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_sent = message_sents(:one)
  end

  test "should get index" do
    get message_sents_url
    assert_response :success
  end

  test "should get new" do
    get new_message_sent_url
    assert_response :success
  end

  test "should create message_sent" do
    assert_difference('MessageSent.count') do
      post message_sents_url, params: { message_sent: {  } }
    end

    assert_redirected_to message_sent_url(MessageSent.last)
  end

  test "should show message_sent" do
    get message_sent_url(@message_sent)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_sent_url(@message_sent)
    assert_response :success
  end

  test "should update message_sent" do
    patch message_sent_url(@message_sent), params: { message_sent: {  } }
    assert_redirected_to message_sent_url(@message_sent)
  end

  test "should destroy message_sent" do
    assert_difference('MessageSent.count', -1) do
      delete message_sent_url(@message_sent)
    end

    assert_redirected_to message_sents_url
  end
end
