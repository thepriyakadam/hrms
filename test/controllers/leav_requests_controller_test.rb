require 'test_helper'

class LeavRequestsControllerTest < ActionController::TestCase
  setup do
    @leav_request = leav_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leav_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leav_request" do
    assert_difference('LeavRequest.count') do
      post :create, leav_request: { applied_on: @leav_request.applied_on, available_leaves: @leav_request.available_leaves, date_from: @leav_request.date_from, date_to: @leav_request.date_to, employee_id: @leav_request.employee_id, leav_type_id: @leav_request.leav_type_id, leave: @leav_request.leave, no_of_days: @leav_request.no_of_days, reason: @leav_request.reason }
    end

    assert_redirected_to leav_request_path(assigns(:leav_request))
  end

  test "should show leav_request" do
    get :show, id: @leav_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leav_request
    assert_response :success
  end

  test "should update leav_request" do
    patch :update, id: @leav_request, leav_request: { applied_on: @leav_request.applied_on, available_leaves: @leav_request.available_leaves, date_from: @leav_request.date_from, date_to: @leav_request.date_to, employee_id: @leav_request.employee_id, leav_type_id: @leav_request.leav_type_id, leave: @leav_request.leave, no_of_days: @leav_request.no_of_days, reason: @leav_request.reason }
    assert_redirected_to leav_request_path(assigns(:leav_request))
  end

  test "should destroy leav_request" do
    assert_difference('LeavRequest.count', -1) do
      delete :destroy, id: @leav_request
    end

    assert_redirected_to leav_requests_path
  end
end
