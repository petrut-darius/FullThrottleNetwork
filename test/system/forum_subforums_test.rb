require "application_system_test_case"

class ForumSubforumsTest < ApplicationSystemTestCase
  setup do
    @forum_subforum = forum_subforums(:one)
  end

  test "visiting the index" do
    visit forum_subforums_url
    assert_selector "h1", text: "Forum subforums"
  end

  test "should create forum subforum" do
    visit forum_subforums_url
    click_on "New forum subforum"

    fill_in "Adminuser", with: @forum_subforum.AdminUser_id
    fill_in "Forum forum", with: @forum_subforum.forum_forum_id
    fill_in "Name", with: @forum_subforum.name
    click_on "Create Forum subforum"

    assert_text "Forum subforum was successfully created"
    click_on "Back"
  end

  test "should update Forum subforum" do
    visit forum_subforum_url(@forum_subforum)
    click_on "Edit this forum subforum", match: :first

    fill_in "Adminuser", with: @forum_subforum.AdminUser_id
    fill_in "Forum forum", with: @forum_subforum.forum_forum_id
    fill_in "Name", with: @forum_subforum.name
    click_on "Update Forum subforum"

    assert_text "Forum subforum was successfully updated"
    click_on "Back"
  end

  test "should destroy Forum subforum" do
    visit forum_subforum_url(@forum_subforum)
    click_on "Destroy this forum subforum", match: :first

    assert_text "Forum subforum was successfully destroyed"
  end
end
