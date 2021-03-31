require "test_helper"

class VotePostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vote_post = vote_posts(:one)
  end

  test "should get index" do
    get vote_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_vote_post_url
    assert_response :success
  end

  test "should create vote_post" do
    assert_difference('VotePost.count') do
      post vote_posts_url, params: { vote_post: { post_id: @vote_post.post_id, type: @vote_post.type, user_id: @vote_post.user_id } }
    end

    assert_redirected_to vote_post_url(VotePost.last)
  end

  test "should show vote_post" do
    get vote_post_url(@vote_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_vote_post_url(@vote_post)
    assert_response :success
  end

  test "should update vote_post" do
    patch vote_post_url(@vote_post), params: { vote_post: { post_id: @vote_post.post_id, type: @vote_post.type, user_id: @vote_post.user_id } }
    assert_redirected_to vote_post_url(@vote_post)
  end

  test "should destroy vote_post" do
    assert_difference('VotePost.count', -1) do
      delete vote_post_url(@vote_post)
    end

    assert_redirected_to vote_posts_url
  end
end
