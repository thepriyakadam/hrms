require 'test_helper'

class IssueTrackerGroupsControllerTest < ActionController::TestCase
  setup do
    @issue_tracker_group = issue_tracker_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issue_tracker_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue_tracker_group" do
    assert_difference('IssueTrackerGroup.count') do
      post :create, issue_tracker_group: { contact_number: @issue_tracker_group.contact_number, email: @issue_tracker_group.email, is_confirm: @issue_tracker_group.is_confirm, name: @issue_tracker_group.name, status: @issue_tracker_group.status }
    end

    assert_redirected_to issue_tracker_group_path(assigns(:issue_tracker_group))
  end

  test "should show issue_tracker_group" do
    get :show, id: @issue_tracker_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue_tracker_group
    assert_response :success
  end

  test "should update issue_tracker_group" do
    patch :update, id: @issue_tracker_group, issue_tracker_group: { contact_number: @issue_tracker_group.contact_number, email: @issue_tracker_group.email, is_confirm: @issue_tracker_group.is_confirm, name: @issue_tracker_group.name, status: @issue_tracker_group.status }
    assert_redirected_to issue_tracker_group_path(assigns(:issue_tracker_group))
  end

  test "should destroy issue_tracker_group" do
    assert_difference('IssueTrackerGroup.count', -1) do
      delete :destroy, id: @issue_tracker_group
    end

    assert_redirected_to issue_tracker_groups_path
  end
end
