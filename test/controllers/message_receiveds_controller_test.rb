require 'test_helper'

class MessageReceivedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_received = message_receiveds(:one)
  end

  test "should get index" do
    get message_receiveds_url
    assert_response :success
  end

  test "should get new" do
    get new_message_received_url
    assert_response :success
  end

  test "should create message_received" do
    assert_difference('MessageReceived.count') do
      post message_receiveds_url, params: { message_received: {  } }
    end

    assert_redirected_to message_received_url(MessageReceived.last)
  end

  test "should show message_received" do
    get message_received_url(@message_received)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_received_url(@message_received)
    assert_response :success
  end

  test "should update message_received" do
    patch message_received_url(@message_received), params: { message_received: {  } }
    assert_redirected_to message_received_url(@message_received)
  end

  test "should destroy message_received" do
    assert_difference('MessageReceived.count', -1) do
      delete message_received_url(@message_received)
    end

    assert_redirected_to message_receiveds_url
  end
end
