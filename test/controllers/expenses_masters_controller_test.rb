require 'test_helper'

class ExpensesMastersControllerTest < ActionController::TestCase
  setup do
    @expenses_master = expenses_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expenses_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expenses_master" do
    assert_difference('ExpensesMaster.count') do
      post :create, expenses_master: { billing_opestion: @expenses_master.billing_opestion, billing_option_id: @expenses_master.billing_option_id, employee_grade_id: @expenses_master.employee_grade_id, expence_opestion_id: @expenses_master.expence_opestion_id, max_amount: @expenses_master.max_amount, min_amount: @expenses_master.min_amount, mode_id: @expenses_master.mode_id, status: @expenses_master.status }
    end

    assert_redirected_to expenses_master_path(assigns(:expenses_master))
  end

  test "should show expenses_master" do
    get :show, id: @expenses_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expenses_master
    assert_response :success
  end

  test "should update expenses_master" do
    patch :update, id: @expenses_master, expenses_master: { billing_opestion: @expenses_master.billing_opestion, billing_option_id: @expenses_master.billing_option_id, employee_grade_id: @expenses_master.employee_grade_id, expence_opestion_id: @expenses_master.expence_opestion_id, max_amount: @expenses_master.max_amount, min_amount: @expenses_master.min_amount, mode_id: @expenses_master.mode_id, status: @expenses_master.status }
    assert_redirected_to expenses_master_path(assigns(:expenses_master))
  end

  test "should destroy expenses_master" do
    assert_difference('ExpensesMaster.count', -1) do
      delete :destroy, id: @expenses_master
    end

    assert_redirected_to expenses_masters_path
  end
end
