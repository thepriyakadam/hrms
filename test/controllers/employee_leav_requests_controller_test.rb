require 'test_helper'

class EmployeeLeavRequestsControllerTest < ActionController::TestCase
  setup do
    @employee_leav_request = employee_leav_requests(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_leav_requests)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create employee_leav_request' do
    assert_difference('EmployeeLeavRequest.count') do
      post :create, employee_leav_request: { employee_id: @employee_leav_request.employee_id, end_date: @employee_leav_request.end_date, leav_category_id: @employee_leav_request.leav_category_id, leave_type: @employee_leav_request.leave_type, satrt_date: @employee_leav_request.satrt_date }
    end

    assert_redirected_to employee_leav_request_path(assigns(:employee_leav_request))
  end

  test 'should show employee_leav_request' do
    get :show, id: @employee_leav_request
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @employee_leav_request
    assert_response :success
  end

  test 'should update employee_leav_request' do
    patch :update, id: @employee_leav_request, employee_leav_request: { employee_id: @employee_leav_request.employee_id, end_date: @employee_leav_request.end_date, leav_category_id: @employee_leav_request.leav_category_id, leave_type: @employee_leav_request.leave_type, satrt_date: @employee_leav_request.satrt_date }
    assert_redirected_to employee_leav_request_path(assigns(:employee_leav_request))
  end

  test 'should destroy employee_leav_request' do
    assert_difference('EmployeeLeavRequest.count', -1) do
      delete :destroy, id: @employee_leav_request
    end

    assert_redirected_to employee_leav_requests_path
  end
end
