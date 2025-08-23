require "test_helper"

class Admin::ForumForumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_forum_forum = admin_forum_forums(:one)
  end

  test "should get index" do
    get admin_forum_forums_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_forum_forum_url
    assert_response :success
  end

  test "should create admin_forum_forum" do
    assert_difference("Admin::ForumForum.count") do
      post admin_forum_forums_url, params: { admin_forum_forum: {} }
    end

    assert_redirected_to admin_forum_forum_url(Admin::ForumForum.last)
  end

  test "should show admin_forum_forum" do
    get admin_forum_forum_url(@admin_forum_forum)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_forum_forum_url(@admin_forum_forum)
    assert_response :success
  end

  test "should update admin_forum_forum" do
    patch admin_forum_forum_url(@admin_forum_forum), params: { admin_forum_forum: {} }
    assert_redirected_to admin_forum_forum_url(@admin_forum_forum)
  end

  test "should destroy admin_forum_forum" do
    assert_difference("Admin::ForumForum.count", -1) do
      delete admin_forum_forum_url(@admin_forum_forum)
    end

    assert_redirected_to admin_forum_forums_url
  end
end
