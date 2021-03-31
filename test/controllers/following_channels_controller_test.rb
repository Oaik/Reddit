require "test_helper"

class FollowingChannelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @following_channel = following_channels(:one)
  end

  test "should get index" do
    get following_channels_url
    assert_response :success
  end

  test "should get new" do
    get new_following_channel_url
    assert_response :success
  end

  test "should create following_channel" do
    assert_difference('FollowingChannel.count') do
      post following_channels_url, params: { following_channel: {  } }
    end

    assert_redirected_to following_channel_url(FollowingChannel.last)
  end

  test "should show following_channel" do
    get following_channel_url(@following_channel)
    assert_response :success
  end

  test "should get edit" do
    get edit_following_channel_url(@following_channel)
    assert_response :success
  end

  test "should update following_channel" do
    patch following_channel_url(@following_channel), params: { following_channel: {  } }
    assert_redirected_to following_channel_url(@following_channel)
  end

  test "should destroy following_channel" do
    assert_difference('FollowingChannel.count', -1) do
      delete following_channel_url(@following_channel)
    end

    assert_redirected_to following_channels_url
  end
end
