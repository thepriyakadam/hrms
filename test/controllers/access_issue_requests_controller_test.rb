require 'test_helper'

class AccessIssueRequestsControllerTest < ActionController::TestCase
  setup do
    @access_issue_request = access_issue_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:access_issue_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create access_issue_request" do
    assert_difference('AccessIssueRequest.count') do
      post :create, access_issue_request: { current_status: @access_issue_request.current_status, issue_request_id: @access_issue_request.issue_request_id, issue_tracker_access_id: @access_issue_request.issue_tracker_access_id, status: @access_issue_request.status }
    end

    assert_redirected_to access_issue_request_path(assigns(:access_issue_request))
  end

  test "should show access_issue_request" do
    get :show, id: @access_issue_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @access_issue_request
    assert_response :success
  end

  test "should update access_issue_request" do
    patch :update, id: @access_issue_request, access_issue_request: { current_status: @access_issue_request.current_status, issue_request_id: @access_issue_request.issue_request_id, issue_tracker_access_id: @access_issue_request.issue_tracker_access_id, status: @access_issue_request.status }
    assert_redirected_to access_issue_request_path(assigns(:access_issue_request))
  end

  test "should destroy access_issue_request" do
    assert_difference('AccessIssueRequest.count', -1) do
      delete :destroy, id: @access_issue_request
    end

    assert_redirected_to access_issue_requests_path
  end
end
