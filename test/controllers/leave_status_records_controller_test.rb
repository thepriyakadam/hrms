require 'test_helper'

class LeaveStatusRecordsControllerTest < ActionController::TestCase
  setup do
    @leave_status_record = leave_status_records(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_status_records)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create leave_status_record' do
    assert_difference('LeaveStatusRecord.count') do
      post :create, leave_status_record: { change_date: @leave_status_record.change_date, change_status_employee_id: @leave_status_record.change_status_employee_id, employee_leav_request_id: @leave_status_record.employee_leav_request_id, status: @leave_status_record.status }
    end

    assert_redirected_to leave_status_record_path(assigns(:leave_status_record))
  end

  test 'should show leave_status_record' do
    get :show, id: @leave_status_record
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @leave_status_record
    assert_response :success
  end

  test 'should update leave_status_record' do
    patch :update, id: @leave_status_record, leave_status_record: { change_date: @leave_status_record.change_date, change_status_employee_id: @leave_status_record.change_status_employee_id, employee_leav_request_id: @leave_status_record.employee_leav_request_id, status: @leave_status_record.status }
    assert_redirected_to leave_status_record_path(assigns(:leave_status_record))
  end

  test 'should destroy leave_status_record' do
    assert_difference('LeaveStatusRecord.count', -1) do
      delete :destroy, id: @leave_status_record
    end

    assert_redirected_to leave_status_records_path
  end
end
