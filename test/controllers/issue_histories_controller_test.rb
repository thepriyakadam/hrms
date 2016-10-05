require 'test_helper'

class IssueHistoriesControllerTest < ActionController::TestCase
  setup do
    @issue_history = issue_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issue_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue_history" do
    assert_difference('IssueHistory.count') do
      post :create, issue_history: { date: @issue_history.date, description: @issue_history.description, employee_id: @issue_history.employee_id, is_confirm: @issue_history.is_confirm, issue_master_id: @issue_history.issue_master_id, issue_priority: @issue_history.issue_priority, issue_request_id: @issue_history.issue_request_id, issue_tracker_group_id: @issue_history.issue_tracker_group_id, issue_tracker_member_id: @issue_history.issue_tracker_member_id, status: @issue_history.status, time: @issue_history.time }
    end

    assert_redirected_to issue_history_path(assigns(:issue_history))
  end

  test "should show issue_history" do
    get :show, id: @issue_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue_history
    assert_response :success
  end

  test "should update issue_history" do
    patch :update, id: @issue_history, issue_history: { date: @issue_history.date, description: @issue_history.description, employee_id: @issue_history.employee_id, is_confirm: @issue_history.is_confirm, issue_master_id: @issue_history.issue_master_id, issue_priority: @issue_history.issue_priority, issue_request_id: @issue_history.issue_request_id, issue_tracker_group_id: @issue_history.issue_tracker_group_id, issue_tracker_member_id: @issue_history.issue_tracker_member_id, status: @issue_history.status, time: @issue_history.time }
    assert_redirected_to issue_history_path(assigns(:issue_history))
  end

  test "should destroy issue_history" do
    assert_difference('IssueHistory.count', -1) do
      delete :destroy, id: @issue_history
    end

    assert_redirected_to issue_histories_path
  end
end
