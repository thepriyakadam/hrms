require 'test_helper'

class LatemarkDeductionsControllerTest < ActionController::TestCase
  setup do
    @latemark_deduction = latemark_deductions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:latemark_deductions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create latemark_deduction" do
    assert_difference('LatemarkDeduction.count') do
      post :create, latemark_deduction: { employee_id: @latemark_deduction.employee_id, latemark_amount: @latemark_deduction.latemark_amount, latemark_count: @latemark_deduction.latemark_count, latemark_day: @latemark_deduction.latemark_day }
    end

    assert_redirected_to latemark_deduction_path(assigns(:latemark_deduction))
  end

  test "should show latemark_deduction" do
    get :show, id: @latemark_deduction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @latemark_deduction
    assert_response :success
  end

  test "should update latemark_deduction" do
    patch :update, id: @latemark_deduction, latemark_deduction: { employee_id: @latemark_deduction.employee_id, latemark_amount: @latemark_deduction.latemark_amount, latemark_count: @latemark_deduction.latemark_count, latemark_day: @latemark_deduction.latemark_day }
    assert_redirected_to latemark_deduction_path(assigns(:latemark_deduction))
  end

  test "should destroy latemark_deduction" do
    assert_difference('LatemarkDeduction.count', -1) do
      delete :destroy, id: @latemark_deduction
    end

    assert_redirected_to latemark_deductions_path
  end
end
