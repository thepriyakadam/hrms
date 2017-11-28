require 'test_helper'

class MonthlyExpencesControllerTest < ActionController::TestCase
  setup do
    @monthly_expence = monthly_expences(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:monthly_expences)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create monthly_expence' do
    assert_difference('MonthlyExpence.count') do
      post :create, monthly_expence: { amount: @monthly_expence.amount, employee_id: @monthly_expence.employee_id, expence_date: @monthly_expence.expence_date }
    end

    assert_redirected_to monthly_expence_path(assigns(:monthly_expence))
  end

  test 'should show monthly_expence' do
    get :show, id: @monthly_expence
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @monthly_expence
    assert_response :success
  end

  test 'should update monthly_expence' do
    patch :update, id: @monthly_expence, monthly_expence: { amount: @monthly_expence.amount, employee_id: @monthly_expence.employee_id, expence_date: @monthly_expence.expence_date }
    assert_redirected_to monthly_expence_path(assigns(:monthly_expence))
  end

  test 'should destroy monthly_expence' do
    assert_difference('MonthlyExpence.count', -1) do
      delete :destroy, id: @monthly_expence
    end

    assert_redirected_to monthly_expences_path
  end
end
