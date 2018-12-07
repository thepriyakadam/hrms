require 'test_helper'

class ShortLeaveRequestsControllerTest < ActionController::TestCase
  setup do
    @short_leave_request = short_leave_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:short_leave_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create short_leave_request" do
    assert_difference('ShortLeaveRequest.count') do
      post :create, short_leave_request: { day: @short_leave_request.day, description: @short_leave_request.description, employee_id: @short_leave_request.employee_id, in_time: @short_leave_request.in_time, manager_id: @short_leave_request.manager_id, out_time: @short_leave_request.out_time, status: @short_leave_request.status }
    end

    assert_redirected_to short_leave_request_path(assigns(:short_leave_request))
  end

  test "should show short_leave_request" do
    get :show, id: @short_leave_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @short_leave_request
    assert_response :success
  end

  test "should update short_leave_request" do
    patch :update, id: @short_leave_request, short_leave_request: { day: @short_leave_request.day, description: @short_leave_request.description, employee_id: @short_leave_request.employee_id, in_time: @short_leave_request.in_time, manager_id: @short_leave_request.manager_id, out_time: @short_leave_request.out_time, status: @short_leave_request.status }
    assert_redirected_to short_leave_request_path(assigns(:short_leave_request))
  end

  test "should destroy short_leave_request" do
    assert_difference('ShortLeaveRequest.count', -1) do
      delete :destroy, id: @short_leave_request
    end

    assert_redirected_to short_leave_requests_path
  end
end
