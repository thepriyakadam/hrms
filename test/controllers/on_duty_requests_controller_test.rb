require 'test_helper'

class OnDutyRequestsControllerTest < ActionController::TestCase
  setup do
    @on_duty_request = on_duty_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:on_duty_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create on_duty_request" do
    assert_difference('OnDutyRequest.count') do
      post :create, on_duty_request: { current_status: @on_duty_request.current_status, employee_id: @on_duty_request.employee_id, end_date: @on_duty_request.end_date, first_half: @on_duty_request.first_half, first_reporter_id: @on_duty_request.first_reporter_id, is_cancelled: @on_duty_request.is_cancelled, is_first_approved: @on_duty_request.is_first_approved, is_first_rejected: @on_duty_request.is_first_rejected, is_pending: @on_duty_request.is_pending, is_second_approved: @on_duty_request.is_second_approved, is_second_rejected: @on_duty_request.is_second_rejected, last_half: @on_duty_request.last_half, leave_type: @on_duty_request.leave_type, no_of_day: @on_duty_request.no_of_day, reason: @on_duty_request.reason, second_reporter_id: @on_duty_request.second_reporter_id, start_date: @on_duty_request.start_date }
    end

    assert_redirected_to on_duty_request_path(assigns(:on_duty_request))
  end

  test "should show on_duty_request" do
    get :show, id: @on_duty_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @on_duty_request
    assert_response :success
  end

  test "should update on_duty_request" do
    patch :update, id: @on_duty_request, on_duty_request: { current_status: @on_duty_request.current_status, employee_id: @on_duty_request.employee_id, end_date: @on_duty_request.end_date, first_half: @on_duty_request.first_half, first_reporter_id: @on_duty_request.first_reporter_id, is_cancelled: @on_duty_request.is_cancelled, is_first_approved: @on_duty_request.is_first_approved, is_first_rejected: @on_duty_request.is_first_rejected, is_pending: @on_duty_request.is_pending, is_second_approved: @on_duty_request.is_second_approved, is_second_rejected: @on_duty_request.is_second_rejected, last_half: @on_duty_request.last_half, leave_type: @on_duty_request.leave_type, no_of_day: @on_duty_request.no_of_day, reason: @on_duty_request.reason, second_reporter_id: @on_duty_request.second_reporter_id, start_date: @on_duty_request.start_date }
    assert_redirected_to on_duty_request_path(assigns(:on_duty_request))
  end

  test "should destroy on_duty_request" do
    assert_difference('OnDutyRequest.count', -1) do
      delete :destroy, id: @on_duty_request
    end

    assert_redirected_to on_duty_requests_path
  end
end
