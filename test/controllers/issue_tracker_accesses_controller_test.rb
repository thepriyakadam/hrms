require 'test_helper'

class IssueTrackerAccessesControllerTest < ActionController::TestCase
  setup do
    @issue_tracker_access = issue_tracker_accesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issue_tracker_accesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue_tracker_access" do
    assert_difference('IssueTrackerAccess.count') do
      post :create, issue_tracker_access: { employee_id: @issue_tracker_access.employee_id, is_confirm: @issue_tracker_access.is_confirm, name: @issue_tracker_access.name, role: @issue_tracker_access.role, status: @issue_tracker_access.status }
    end

    assert_redirected_to issue_tracker_access_path(assigns(:issue_tracker_access))
  end

  test "should show issue_tracker_access" do
    get :show, id: @issue_tracker_access
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue_tracker_access
    assert_response :success
  end

  test "should update issue_tracker_access" do
    patch :update, id: @issue_tracker_access, issue_tracker_access: { employee_id: @issue_tracker_access.employee_id, is_confirm: @issue_tracker_access.is_confirm, name: @issue_tracker_access.name, role: @issue_tracker_access.role, status: @issue_tracker_access.status }
    assert_redirected_to issue_tracker_access_path(assigns(:issue_tracker_access))
  end

  test "should destroy issue_tracker_access" do
    assert_difference('IssueTrackerAccess.count', -1) do
      delete :destroy, id: @issue_tracker_access
    end

    assert_redirected_to issue_tracker_accesses_path
  end
end
