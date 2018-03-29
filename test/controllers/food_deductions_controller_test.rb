require 'test_helper'

class FoodDeductionsControllerTest < ActionController::TestCase
  setup do
    @food_deduction = food_deductions(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:food_deductions)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create food_deduction' do
    assert_difference('FoodDeduction.count') do
      post :create, food_deduction: { amount: @food_deduction.amount, employee_id: @food_deduction.employee_id, food_date: @food_deduction.food_date, no_of_coupan: @food_deduction.no_of_coupan, rate: @food_deduction.rate }
    end

    assert_redirected_to food_deduction_path(assigns(:food_deduction))
  end

  test 'should show food_deduction' do
    get :show, id: @food_deduction
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @food_deduction
    assert_response :success
  end

  test 'should update food_deduction' do
    patch :update, id: @food_deduction, food_deduction: { amount: @food_deduction.amount, employee_id: @food_deduction.employee_id, food_date: @food_deduction.food_date, no_of_coupan: @food_deduction.no_of_coupan, rate: @food_deduction.rate }
    assert_redirected_to food_deduction_path(assigns(:food_deduction))
  end

  test 'should destroy food_deduction' do
    assert_difference('FoodDeduction.count', -1) do
      delete :destroy, id: @food_deduction
    end

    assert_redirected_to food_deductions_path
  end
end
