require "application_system_test_case"

class VotePostsTest < ApplicationSystemTestCase
  setup do
    @vote_post = vote_posts(:one)
  end

  test "visiting the index" do
    visit vote_posts_url
    assert_selector "h1", text: "Vote Posts"
  end

  test "creating a Vote post" do
    visit vote_posts_url
    click_on "New Vote Post"

    fill_in "Post", with: @vote_post.post_id
    fill_in "Type", with: @vote_post.type
    fill_in "User", with: @vote_post.user_id
    click_on "Create Vote post"

    assert_text "Vote post was successfully created"
    click_on "Back"
  end

  test "updating a Vote post" do
    visit vote_posts_url
    click_on "Edit", match: :first

    fill_in "Post", with: @vote_post.post_id
    fill_in "Type", with: @vote_post.type
    fill_in "User", with: @vote_post.user_id
    click_on "Update Vote post"

    assert_text "Vote post was successfully updated"
    click_on "Back"
  end

  test "destroying a Vote post" do
    visit vote_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vote post was successfully destroyed"
  end
end
