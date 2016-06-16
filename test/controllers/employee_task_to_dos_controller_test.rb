require 'test_helper'

class EmployeeTaskToDosControllerTest < ActionController::TestCase
  setup do
    @employee_task_to_do = employee_task_to_dos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_task_to_dos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_task_to_do" do
    assert_difference('EmployeeTaskToDo.count') do
      post :create, employee_task_to_do: { employee_id: @employee_task_to_do.employee_id, status: @employee_task_to_do.status, task_date: @employee_task_to_do.task_date, task_name: @employee_task_to_do.task_name, time: @employee_task_to_do.time }
    end

    assert_redirected_to employee_task_to_do_path(assigns(:employee_task_to_do))
  end

  test "should show employee_task_to_do" do
    get :show, id: @employee_task_to_do
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_task_to_do
    assert_response :success
  end

  test "should update employee_task_to_do" do
    patch :update, id: @employee_task_to_do, employee_task_to_do: { employee_id: @employee_task_to_do.employee_id, status: @employee_task_to_do.status, task_date: @employee_task_to_do.task_date, task_name: @employee_task_to_do.task_name, time: @employee_task_to_do.time }
    assert_redirected_to employee_task_to_do_path(assigns(:employee_task_to_do))
  end

  test "should destroy employee_task_to_do" do
    assert_difference('EmployeeTaskToDo.count', -1) do
      delete :destroy, id: @employee_task_to_do
    end

    assert_redirected_to employee_task_to_dos_path
  end
end
