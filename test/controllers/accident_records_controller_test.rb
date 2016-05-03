require 'test_helper'

class AccidentRecordsControllerTest < ActionController::TestCase
  setup do
    @accident_record = accident_records(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:accident_records)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create accident_record' do
    assert_difference('AccidentRecord.count') do
      post :create, accident_record: { accident_date: @accident_record.accident_date, case_type: @accident_record.case_type, code: @accident_record.code, description: @accident_record.description, employee_id: @accident_record.employee_id, esic_no: @accident_record.esic_no, leave_date_range: @accident_record.leave_date_range, no_of_day: @accident_record.no_of_day, type_of_injury: @accident_record.type_of_injury }
    end

    assert_redirected_to accident_record_path(assigns(:accident_record))
  end

  test 'should show accident_record' do
    get :show, id: @accident_record
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @accident_record
    assert_response :success
  end

  test 'should update accident_record' do
    patch :update, id: @accident_record, accident_record: { accident_date: @accident_record.accident_date, case_type: @accident_record.case_type, code: @accident_record.code, description: @accident_record.description, employee_id: @accident_record.employee_id, esic_no: @accident_record.esic_no, leave_date_range: @accident_record.leave_date_range, no_of_day: @accident_record.no_of_day, type_of_injury: @accident_record.type_of_injury }
    assert_redirected_to accident_record_path(assigns(:accident_record))
  end

  test 'should destroy accident_record' do
    assert_difference('AccidentRecord.count', -1) do
      delete :destroy, id: @accident_record
    end

    assert_redirected_to accident_records_path
  end
end
