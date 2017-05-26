require 'test_helper'

class IssueRootCausesControllerTest < ActionController::TestCase
  setup do
    @issue_root_cause = issue_root_causes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issue_root_causes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue_root_cause" do
    assert_difference('IssueRootCause.count') do
      post :create, issue_root_cause: { is_active: @issue_root_cause.is_active, is_confirm: @issue_root_cause.is_confirm, issue_tracker_group_id: @issue_root_cause.issue_tracker_group_id, name: @issue_root_cause.name }
    end

    assert_redirected_to issue_root_cause_path(assigns(:issue_root_cause))
  end

  test "should show issue_root_cause" do
    get :show, id: @issue_root_cause
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue_root_cause
    assert_response :success
  end

  test "should update issue_root_cause" do
    patch :update, id: @issue_root_cause, issue_root_cause: { is_active: @issue_root_cause.is_active, is_confirm: @issue_root_cause.is_confirm, issue_tracker_group_id: @issue_root_cause.issue_tracker_group_id, name: @issue_root_cause.name }
    assert_redirected_to issue_root_cause_path(assigns(:issue_root_cause))
  end

  test "should destroy issue_root_cause" do
    assert_difference('IssueRootCause.count', -1) do
      delete :destroy, id: @issue_root_cause
    end

    assert_redirected_to issue_root_causes_path
  end
end
