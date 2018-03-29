require 'test_helper'

class IssueRequestsControllerTest < ActionController::TestCase
  setup do
    @issue_request = issue_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issue_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue_request" do
    assert_difference('IssueRequest.count') do
      post :create, issue_request: { date: @issue_request.date, description: @issue_request.description, employee_id: @issue_request.employee_id, is_confirm_id: @issue_request.is_confirm_id, issue_master_id: @issue_request.issue_master_id, issue_priority: @issue_request.issue_priority, issue_tracker_group_id: @issue_request.issue_tracker_group_id, issue_tracker_member_id: @issue_request.issue_tracker_member_id, status_id: @issue_request.status_id, time: @issue_request.time }
    end

    assert_redirected_to issue_request_path(assigns(:issue_request))
  end

  test "should show issue_request" do
    get :show, id: @issue_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue_request
    assert_response :success
  end

  test "should update issue_request" do
    patch :update, id: @issue_request, issue_request: { date: @issue_request.date, description: @issue_request.description, employee_id: @issue_request.employee_id, is_confirm_id: @issue_request.is_confirm_id, issue_master_id: @issue_request.issue_master_id, issue_priority: @issue_request.issue_priority, issue_tracker_group_id: @issue_request.issue_tracker_group_id, issue_tracker_member_id: @issue_request.issue_tracker_member_id, status_id: @issue_request.status_id, time: @issue_request.time }
    assert_redirected_to issue_request_path(assigns(:issue_request))
  end

  test "should destroy issue_request" do
    assert_difference('IssueRequest.count', -1) do
      delete :destroy, id: @issue_request
    end

    assert_redirected_to issue_requests_path
  end
end
