require "test_helper"

class Admin::ForumSubforumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_forum_subforum = admin_forum_subforums(:one)
  end

  test "should get index" do
    get admin_forum_subforums_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_forum_subforum_url
    assert_response :success
  end

  test "should create admin_forum_subforum" do
    assert_difference("Admin::ForumSubforum.count") do
      post admin_forum_subforums_url, params: { admin_forum_subforum: {} }
    end

    assert_redirected_to admin_forum_subforum_url(Admin::ForumSubforum.last)
  end

  test "should show admin_forum_subforum" do
    get admin_forum_subforum_url(@admin_forum_subforum)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_forum_subforum_url(@admin_forum_subforum)
    assert_response :success
  end

  test "should update admin_forum_subforum" do
    patch admin_forum_subforum_url(@admin_forum_subforum), params: { admin_forum_subforum: {} }
    assert_redirected_to admin_forum_subforum_url(@admin_forum_subforum)
  end

  test "should destroy admin_forum_subforum" do
    assert_difference("Admin::ForumSubforum.count", -1) do
      delete admin_forum_subforum_url(@admin_forum_subforum)
    end

    assert_redirected_to admin_forum_subforums_url
  end
end
