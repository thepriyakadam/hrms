require 'test_helper'

class OvertimeDailyRecordsControllerTest < ActionController::TestCase
  setup do
    @overtime_daily_record = overtime_daily_records(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:overtime_daily_records)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create overtime_daily_record' do
    assert_difference('OvertimeDailyRecord.count') do
      post :create, overtime_daily_record: { employee_id: @overtime_daily_record.employee_id, ot_daily_amount: @overtime_daily_record.ot_daily_amount, ot_daily_date: @overtime_daily_record.ot_daily_date, ot_daily_hrs: @overtime_daily_record.ot_daily_hrs, ot_rate: @overtime_daily_record.ot_rate }
    end

    assert_redirected_to overtime_daily_record_path(assigns(:overtime_daily_record))
  end

  test 'should show overtime_daily_record' do
    get :show, id: @overtime_daily_record
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @overtime_daily_record
    assert_response :success
  end

  test 'should update overtime_daily_record' do
    patch :update, id: @overtime_daily_record, overtime_daily_record: { employee_id: @overtime_daily_record.employee_id, ot_daily_amount: @overtime_daily_record.ot_daily_amount, ot_daily_date: @overtime_daily_record.ot_daily_date, ot_daily_hrs: @overtime_daily_record.ot_daily_hrs, ot_rate: @overtime_daily_record.ot_rate }
    assert_redirected_to overtime_daily_record_path(assigns(:overtime_daily_record))
  end

  test 'should destroy overtime_daily_record' do
    assert_difference('OvertimeDailyRecord.count', -1) do
      delete :destroy, id: @overtime_daily_record
    end

    assert_redirected_to overtime_daily_records_path
  end
end
