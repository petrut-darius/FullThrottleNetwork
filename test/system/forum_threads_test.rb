require "application_system_test_case"

class ForumThreadsTest < ApplicationSystemTestCase
  setup do
    @forum_thread = forum_threads(:one)
  end

  test "visiting the index" do
    visit forum_threads_url
    assert_selector "h1", text: "Forum threads"
  end

  test "should create forum thread" do
    visit forum_threads_url
    click_on "New forum thread"

    fill_in "Admin user", with: @forum_thread.admin_user_id
    fill_in "Forum forum", with: @forum_thread.forum_forum_id
    fill_in "Forum subforum", with: @forum_thread.forum_subforum_id
    fill_in "Name", with: @forum_thread.name
    click_on "Create Forum thread"

    assert_text "Forum thread was successfully created"
    click_on "Back"
  end

  test "should update Forum thread" do
    visit forum_thread_url(@forum_thread)
    click_on "Edit this forum thread", match: :first

    fill_in "Admin user", with: @forum_thread.admin_user_id
    fill_in "Forum forum", with: @forum_thread.forum_forum_id
    fill_in "Forum subforum", with: @forum_thread.forum_subforum_id
    fill_in "Name", with: @forum_thread.name
    click_on "Update Forum thread"

    assert_text "Forum thread was successfully updated"
    click_on "Back"
  end

  test "should destroy Forum thread" do
    visit forum_thread_url(@forum_thread)
    click_on "Destroy this forum thread", match: :first

    assert_text "Forum thread was successfully destroyed"
  end
end
