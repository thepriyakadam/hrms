require 'test_helper'

class IssueLockerHistoriesControllerTest < ActionController::TestCase
  setup do
    @issue_locker_history = issue_locker_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issue_locker_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue_locker_history" do
    assert_difference('IssueLockerHistory.count') do
      post :create, issue_locker_history: { employee_id: @issue_locker_history.employee_id, issue_locker_id: @issue_locker_history.issue_locker_id, issue_request_id: @issue_locker_history.issue_request_id, status: @issue_locker_history.status }
    end

    assert_redirected_to issue_locker_history_path(assigns(:issue_locker_history))
  end

  test "should show issue_locker_history" do
    get :show, id: @issue_locker_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue_locker_history
    assert_response :success
  end

  test "should update issue_locker_history" do
    patch :update, id: @issue_locker_history, issue_locker_history: { employee_id: @issue_locker_history.employee_id, issue_locker_id: @issue_locker_history.issue_locker_id, issue_request_id: @issue_locker_history.issue_request_id, status: @issue_locker_history.status }
    assert_redirected_to issue_locker_history_path(assigns(:issue_locker_history))
  end

  test "should destroy issue_locker_history" do
    assert_difference('IssueLockerHistory.count', -1) do
      delete :destroy, id: @issue_locker_history
    end

    assert_redirected_to issue_locker_histories_path
  end
end
