require 'test_helper'

class EmployeeJcListsControllerTest < ActionController::TestCase
  setup do
    @employee_jc_list = employee_jc_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_jc_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_jc_list" do
    assert_difference('EmployeeJcList.count') do
      post :create, employee_jc_list: { admin_id: @employee_jc_list.admin_id, employee_id: @employee_jc_list.employee_id, joining_checklist_master_id: @employee_jc_list.joining_checklist_master_id, status: @employee_jc_list.status }
    end

    assert_redirected_to employee_jc_list_path(assigns(:employee_jc_list))
  end

  test "should show employee_jc_list" do
    get :show, id: @employee_jc_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_jc_list
    assert_response :success
  end

  test "should update employee_jc_list" do
    patch :update, id: @employee_jc_list, employee_jc_list: { admin_id: @employee_jc_list.admin_id, employee_id: @employee_jc_list.employee_id, joining_checklist_master_id: @employee_jc_list.joining_checklist_master_id, status: @employee_jc_list.status }
    assert_redirected_to employee_jc_list_path(assigns(:employee_jc_list))
  end

  test "should destroy employee_jc_list" do
    assert_difference('EmployeeJcList.count', -1) do
      delete :destroy, id: @employee_jc_list
    end

    assert_redirected_to employee_jc_lists_path
  end
end
