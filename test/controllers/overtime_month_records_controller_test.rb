require 'test_helper'

class OvertimeMonthRecordsControllerTest < ActionController::TestCase
  setup do
    @overtime_month_record = overtime_month_records(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:overtime_month_records)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create overtime_month_record' do
    assert_difference('OvertimeMonthRecord.count') do
      post :create, overtime_month_record: { attendance_bonus_amount: @overtime_month_record.attendance_bonus_amount, employee_id: @overtime_month_record.employee_id, overtime_data: @overtime_month_record.overtime_data, paid_holiday_amount: @overtime_month_record.paid_holiday_amount }
    end

    assert_redirected_to overtime_month_record_path(assigns(:overtime_month_record))
  end

  test 'should show overtime_month_record' do
    get :show, id: @overtime_month_record
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @overtime_month_record
    assert_response :success
  end

  test 'should update overtime_month_record' do
    patch :update, id: @overtime_month_record, overtime_month_record: { attendance_bonus_amount: @overtime_month_record.attendance_bonus_amount, employee_id: @overtime_month_record.employee_id, overtime_data: @overtime_month_record.overtime_data, paid_holiday_amount: @overtime_month_record.paid_holiday_amount }
    assert_redirected_to overtime_month_record_path(assigns(:overtime_month_record))
  end

  test 'should destroy overtime_month_record' do
    assert_difference('OvertimeMonthRecord.count', -1) do
      delete :destroy, id: @overtime_month_record
    end

    assert_redirected_to overtime_month_records_path
  end
end
