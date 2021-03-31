require "application_system_test_case"

class FollowingChannelsTest < ApplicationSystemTestCase
  setup do
    @following_channel = following_channels(:one)
  end

  test "visiting the index" do
    visit following_channels_url
    assert_selector "h1", text: "Following Channels"
  end

  test "creating a Following channel" do
    visit following_channels_url
    click_on "New Following Channel"

    click_on "Create Following channel"

    assert_text "Following channel was successfully created"
    click_on "Back"
  end

  test "updating a Following channel" do
    visit following_channels_url
    click_on "Edit", match: :first

    click_on "Update Following channel"

    assert_text "Following channel was successfully updated"
    click_on "Back"
  end

  test "destroying a Following channel" do
    visit following_channels_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Following channel was successfully destroyed"
  end
end
