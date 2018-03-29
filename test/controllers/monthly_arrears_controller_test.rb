require 'test_helper'

class MonthlyArrearsControllerTest < ActionController::TestCase
  setup do
    @monthly_arrear = monthly_arrears(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monthly_arrears)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monthly_arrear" do
    assert_difference('MonthlyArrear.count') do
      post :create, monthly_arrear: { amount: @monthly_arrear.amount, day: @monthly_arrear.day, description: @monthly_arrear.description, employee_id: @monthly_arrear.employee_id, is_paid: @monthly_arrear.is_paid }
    end

    assert_redirected_to monthly_arrear_path(assigns(:monthly_arrear))
  end

  test "should show monthly_arrear" do
    get :show, id: @monthly_arrear
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monthly_arrear
    assert_response :success
  end

  test "should update monthly_arrear" do
    patch :update, id: @monthly_arrear, monthly_arrear: { amount: @monthly_arrear.amount, day: @monthly_arrear.day, description: @monthly_arrear.description, employee_id: @monthly_arrear.employee_id, is_paid: @monthly_arrear.is_paid }
    assert_redirected_to monthly_arrear_path(assigns(:monthly_arrear))
  end

  test "should destroy monthly_arrear" do
    assert_difference('MonthlyArrear.count', -1) do
      delete :destroy, id: @monthly_arrear
    end

    assert_redirected_to monthly_arrears_path
  end
end
