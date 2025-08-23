require "application_system_test_case"

class Admin::ForumSubforumsTest < ApplicationSystemTestCase
  setup do
    @admin_forum_subforum = admin_forum_subforums(:one)
  end

  test "visiting the index" do
    visit admin_forum_subforums_url
    assert_selector "h1", text: "Forum subforums"
  end

  test "should create forum subforum" do
    visit admin_forum_subforums_url
    click_on "New forum subforum"

    click_on "Create Forum subforum"

    assert_text "Forum subforum was successfully created"
    click_on "Back"
  end

  test "should update Forum subforum" do
    visit admin_forum_subforum_url(@admin_forum_subforum)
    click_on "Edit this forum subforum", match: :first

    click_on "Update Forum subforum"

    assert_text "Forum subforum was successfully updated"
    click_on "Back"
  end

  test "should destroy Forum subforum" do
    visit admin_forum_subforum_url(@admin_forum_subforum)
    click_on "Destroy this forum subforum", match: :first

    assert_text "Forum subforum was successfully destroyed"
  end
end
