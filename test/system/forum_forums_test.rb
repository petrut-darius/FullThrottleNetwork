require "application_system_test_case"

class ForumForumsTest < ApplicationSystemTestCase
  setup do
    @forum_forum = forum_forums(:one)
  end

  test "visiting the index" do
    visit forum_forums_url
    assert_selector "h1", text: "Forum forums"
  end

  test "should create forum forum" do
    visit forum_forums_url
    click_on "New forum forum"

    fill_in "Admin user", with: @forum_forum.admin_user_id
    fill_in "Name", with: @forum_forum.name
    click_on "Create Forum forum"

    assert_text "Forum forum was successfully created"
    click_on "Back"
  end

  test "should update Forum forum" do
    visit forum_forum_url(@forum_forum)
    click_on "Edit this forum forum", match: :first

    fill_in "Admin user", with: @forum_forum.admin_user_id
    fill_in "Name", with: @forum_forum.name
    click_on "Update Forum forum"

    assert_text "Forum forum was successfully updated"
    click_on "Back"
  end

  test "should destroy Forum forum" do
    visit forum_forum_url(@forum_forum)
    click_on "Destroy this forum forum", match: :first

    assert_text "Forum forum was successfully destroyed"
  end
end
