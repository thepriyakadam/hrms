require 'test_helper'

class EmployeeLeavBalancesControllerTest < ActionController::TestCase
  setup do
    @employee_leav_balance = employee_leav_balances(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_leav_balances)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create employee_leav_balance' do
    assert_difference('EmployeeLeavBalance.count') do
      post :create, employee_leav_balance: { employee_id: @employee_leav_balance.employee_id, leav_category_id: @employee_leav_balance.leav_category_id, no_of_leave: @employee_leav_balance.no_of_leave }
    end

    assert_redirected_to employee_leav_balance_path(assigns(:employee_leav_balance))
  end

  test 'should show employee_leav_balance' do
    get :show, id: @employee_leav_balance
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @employee_leav_balance
    assert_response :success
  end

  test 'should update employee_leav_balance' do
    patch :update, id: @employee_leav_balance, employee_leav_balance: { employee_id: @employee_leav_balance.employee_id, leav_category_id: @employee_leav_balance.leav_category_id, no_of_leave: @employee_leav_balance.no_of_leave }
    assert_redirected_to employee_leav_balance_path(assigns(:employee_leav_balance))
  end

  test 'should destroy employee_leav_balance' do
    assert_difference('EmployeeLeavBalance.count', -1) do
      delete :destroy, id: @employee_leav_balance
    end

    assert_redirected_to employee_leav_balances_path
  end
end
