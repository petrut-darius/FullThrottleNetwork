require "application_system_test_case"

class Admin::ForumForumsTest < ApplicationSystemTestCase
  setup do
    @admin_forum_forum = admin_forum_forums(:one)
  end

  test "visiting the index" do
    visit admin_forum_forums_url
    assert_selector "h1", text: "Forum forums"
  end

  test "should create forum forum" do
    visit admin_forum_forums_url
    click_on "New forum forum"

    click_on "Create Forum forum"

    assert_text "Forum forum was successfully created"
    click_on "Back"
  end

  test "should update Forum forum" do
    visit admin_forum_forum_url(@admin_forum_forum)
    click_on "Edit this forum forum", match: :first

    click_on "Update Forum forum"

    assert_text "Forum forum was successfully updated"
    click_on "Back"
  end

  test "should destroy Forum forum" do
    visit admin_forum_forum_url(@admin_forum_forum)
    click_on "Destroy this forum forum", match: :first

    assert_text "Forum forum was successfully destroyed"
  end
end
