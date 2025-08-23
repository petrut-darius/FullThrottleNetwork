require "test_helper"

class ForumSubforumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forum_subforum = forum_subforums(:one)
  end

  test "should get index" do
    get forum_subforums_url
    assert_response :success
  end

  test "should get new" do
    get new_forum_subforum_url
    assert_response :success
  end

  test "should create forum_subforum" do
    assert_difference("ForumSubforum.count") do
      post forum_subforums_url, params: { forum_subforum: { AdminUser_id: @forum_subforum.AdminUser_id, forum_forum_id: @forum_subforum.forum_forum_id, name: @forum_subforum.name } }
    end

    assert_redirected_to forum_subforum_url(ForumSubforum.last)
  end

  test "should show forum_subforum" do
    get forum_subforum_url(@forum_subforum)
    assert_response :success
  end

  test "should get edit" do
    get edit_forum_subforum_url(@forum_subforum)
    assert_response :success
  end

  test "should update forum_subforum" do
    patch forum_subforum_url(@forum_subforum), params: { forum_subforum: { AdminUser_id: @forum_subforum.AdminUser_id, forum_forum_id: @forum_subforum.forum_forum_id, name: @forum_subforum.name } }
    assert_redirected_to forum_subforum_url(@forum_subforum)
  end

  test "should destroy forum_subforum" do
    assert_difference("ForumSubforum.count", -1) do
      delete forum_subforum_url(@forum_subforum)
    end

    assert_redirected_to forum_subforums_url
  end
end
