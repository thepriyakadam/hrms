require 'test_helper'

class EmployeeMonthlyDaysControllerTest < ActionController::TestCase
  setup do
    @employee_monthly_day = employee_monthly_days(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_monthly_days)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create employee_monthly_day' do
    assert_difference('EmployeeMonthlyDay.count') do
      post :create, employee_monthly_day: { employee_id: @employee_monthly_day.employee_id, month: @employee_monthly_day.month, overtime: @employee_monthly_day.overtime, year_id: @employee_monthly_day.year_id }
    end

    assert_redirected_to employee_monthly_day_path(assigns(:employee_monthly_day))
  end

  test 'should show employee_monthly_day' do
    get :show, id: @employee_monthly_day
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @employee_monthly_day
    assert_response :success
  end

  test 'should update employee_monthly_day' do
    patch :update, id: @employee_monthly_day, employee_monthly_day: { employee_id: @employee_monthly_day.employee_id, month: @employee_monthly_day.month, overtime: @employee_monthly_day.overtime, year_id: @employee_monthly_day.year_id }
    assert_redirected_to employee_monthly_day_path(assigns(:employee_monthly_day))
  end

  test 'should destroy employee_monthly_day' do
    assert_difference('EmployeeMonthlyDay.count', -1) do
      delete :destroy, id: @employee_monthly_day
    end

    assert_redirected_to employee_monthly_days_path
  end
end
