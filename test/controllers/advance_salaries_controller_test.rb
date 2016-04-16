require 'test_helper'

class AdvanceSalariesControllerTest < ActionController::TestCase
  setup do
    @advance_salary = advance_salaries(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:advance_salaries)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create advance_salary' do
    assert_difference('AdvanceSalary.count') do
      post :create, advance_salary: { advance_amount: @advance_salary.advance_amount, advance_date: @advance_salary.advance_date, employee_id: @advance_salary.employee_id, instalment_amount: @advance_salary.instalment_amount, no_of_instalment: @advance_salary.no_of_instalment }
    end

    assert_redirected_to advance_salary_path(assigns(:advance_salary))
  end

  test 'should show advance_salary' do
    get :show, id: @advance_salary
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @advance_salary
    assert_response :success
  end

  test 'should update advance_salary' do
    patch :update, id: @advance_salary, advance_salary: { advance_amount: @advance_salary.advance_amount, advance_date: @advance_salary.advance_date, employee_id: @advance_salary.employee_id, instalment_amount: @advance_salary.instalment_amount, no_of_instalment: @advance_salary.no_of_instalment }
    assert_redirected_to advance_salary_path(assigns(:advance_salary))
  end

  test 'should destroy advance_salary' do
    assert_difference('AdvanceSalary.count', -1) do
      delete :destroy, id: @advance_salary
    end

    assert_redirected_to advance_salaries_path
  end
end
