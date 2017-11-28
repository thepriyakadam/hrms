require 'test_helper'

class BonusEmployeesControllerTest < ActionController::TestCase
  setup do
    @bonus_employee = bonus_employees(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:bonus_employees)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create bonus_employee' do
    assert_difference('BonusEmployee.count') do
      post :create, bonus_employee: { amount: @bonus_employee.amount, bonus_date: @bonus_employee.bonus_date, employee_id: @bonus_employee.employee_id }
    end

    assert_redirected_to bonus_employee_path(assigns(:bonus_employee))
  end

  test 'should show bonus_employee' do
    get :show, id: @bonus_employee
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @bonus_employee
    assert_response :success
  end

  test 'should update bonus_employee' do
    patch :update, id: @bonus_employee, bonus_employee: { amount: @bonus_employee.amount, bonus_date: @bonus_employee.bonus_date, employee_id: @bonus_employee.employee_id }
    assert_redirected_to bonus_employee_path(assigns(:bonus_employee))
  end

  test 'should destroy bonus_employee' do
    assert_difference('BonusEmployee.count', -1) do
      delete :destroy, id: @bonus_employee
    end

    assert_redirected_to bonus_employees_path
  end
end
