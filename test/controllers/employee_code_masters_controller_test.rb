require 'test_helper'

class EmployeeCodeMastersControllerTest < ActionController::TestCase
  setup do
    @employee_code_master = employee_code_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_code_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_code_master" do
    assert_difference('EmployeeCodeMaster.count') do
      post :create, employee_code_master: { is_active: @employee_code_master.is_active, is_confirm: @employee_code_master.is_confirm, last_range: @employee_code_master.last_range, name: @employee_code_master.name, range: @employee_code_master.range }
    end

    assert_redirected_to employee_code_master_path(assigns(:employee_code_master))
  end

  test "should show employee_code_master" do
    get :show, id: @employee_code_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_code_master
    assert_response :success
  end

  test "should update employee_code_master" do
    patch :update, id: @employee_code_master, employee_code_master: { is_active: @employee_code_master.is_active, is_confirm: @employee_code_master.is_confirm, last_range: @employee_code_master.last_range, name: @employee_code_master.name, range: @employee_code_master.range }
    assert_redirected_to employee_code_master_path(assigns(:employee_code_master))
  end

  test "should destroy employee_code_master" do
    assert_difference('EmployeeCodeMaster.count', -1) do
      delete :destroy, id: @employee_code_master
    end

    assert_redirected_to employee_code_masters_path
  end
end
