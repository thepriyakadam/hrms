require 'test_helper'

class AnnualSalaryMastersControllerTest < ActionController::TestCase
  setup do
    @annual_salary_master = annual_salary_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:annual_salary_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create annual_salary_master" do
    assert_difference('AnnualSalaryMaster.count') do
      post :create, annual_salary_master: { amount: @annual_salary_master.amount, code: @annual_salary_master.code, description: @annual_salary_master.description, employee_id: @annual_salary_master.employee_id, name: @annual_salary_master.name }
    end

    assert_redirected_to annual_salary_master_path(assigns(:annual_salary_master))
  end

  test "should show annual_salary_master" do
    get :show, id: @annual_salary_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @annual_salary_master
    assert_response :success
  end

  test "should update annual_salary_master" do
    patch :update, id: @annual_salary_master, annual_salary_master: { amount: @annual_salary_master.amount, code: @annual_salary_master.code, description: @annual_salary_master.description, employee_id: @annual_salary_master.employee_id, name: @annual_salary_master.name }
    assert_redirected_to annual_salary_master_path(assigns(:annual_salary_master))
  end

  test "should destroy annual_salary_master" do
    assert_difference('AnnualSalaryMaster.count', -1) do
      delete :destroy, id: @annual_salary_master
    end

    assert_redirected_to annual_salary_masters_path
  end
end
