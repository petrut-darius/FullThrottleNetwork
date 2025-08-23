require "test_helper"

class ForumForumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forum_forum = forum_forums(:one)
  end

  test "should get index" do
    get forum_forums_url
    assert_response :success
  end

  test "should get new" do
    get new_forum_forum_url
    assert_response :success
  end

  test "should create forum_forum" do
    assert_difference("ForumForum.count") do
      post forum_forums_url, params: { forum_forum: { admin_user_id: @forum_forum.admin_user_id, name: @forum_forum.name } }
    end

    assert_redirected_to forum_forum_url(ForumForum.last)
  end

  test "should show forum_forum" do
    get forum_forum_url(@forum_forum)
    assert_response :success
  end

  test "should get edit" do
    get edit_forum_forum_url(@forum_forum)
    assert_response :success
  end

  test "should update forum_forum" do
    patch forum_forum_url(@forum_forum), params: { forum_forum: { admin_user_id: @forum_forum.admin_user_id, name: @forum_forum.name } }
    assert_redirected_to forum_forum_url(@forum_forum)
  end

  test "should destroy forum_forum" do
    assert_difference("ForumForum.count", -1) do
      delete forum_forum_url(@forum_forum)
    end

    assert_redirected_to forum_forums_url
  end
end
