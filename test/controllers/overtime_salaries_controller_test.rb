require 'test_helper'

class OvertimeSalariesControllerTest < ActionController::TestCase
  setup do
    @overtime_salary = overtime_salaries(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:overtime_salaries)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create overtime_salary' do
    assert_difference('OvertimeSalary.count') do
      post :create, overtime_salary: { attendence_bouns_amount: @overtime_salary.attendence_bouns_amount, date: @overtime_salary.date, employee_id: @overtime_salary.employee_id, net_payble_amount: @overtime_salary.net_payble_amount, ot_esic_amount: @overtime_salary.ot_esic_amount, ot_hrs: @overtime_salary.ot_hrs, paid_holiday_amount: @overtime_salary.paid_holiday_amount, total_amount: @overtime_salary.total_amount }
    end

    assert_redirected_to overtime_salary_path(assigns(:overtime_salary))
  end

  test 'should show overtime_salary' do
    get :show, id: @overtime_salary
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @overtime_salary
    assert_response :success
  end

  test 'should update overtime_salary' do
    patch :update, id: @overtime_salary, overtime_salary: { attendence_bouns_amount: @overtime_salary.attendence_bouns_amount, date: @overtime_salary.date, employee_id: @overtime_salary.employee_id, net_payble_amount: @overtime_salary.net_payble_amount, ot_esic_amount: @overtime_salary.ot_esic_amount, ot_hrs: @overtime_salary.ot_hrs, paid_holiday_amount: @overtime_salary.paid_holiday_amount, total_amount: @overtime_salary.total_amount }
    assert_redirected_to overtime_salary_path(assigns(:overtime_salary))
  end

  test 'should destroy overtime_salary' do
    assert_difference('OvertimeSalary.count', -1) do
      delete :destroy, id: @overtime_salary
    end

    assert_redirected_to overtime_salaries_path
  end
end
