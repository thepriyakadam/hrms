require 'test_helper'

class EmployeeInsentivesControllerTest < ActionController::TestCase
  setup do
    @employee_insentive = employee_insentives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_insentives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_insentive" do
    assert_difference('EmployeeInsentive.count') do
      post :create, employee_insentive: { amount: @employee_insentive.amount, date: @employee_insentive.date, employee_id: @employee_insentive.employee_id, status: @employee_insentive.status }
    end

    assert_redirected_to employee_insentive_path(assigns(:employee_insentive))
  end

  test "should show employee_insentive" do
    get :show, id: @employee_insentive
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_insentive
    assert_response :success
  end

  test "should update employee_insentive" do
    patch :update, id: @employee_insentive, employee_insentive: { amount: @employee_insentive.amount, date: @employee_insentive.date, employee_id: @employee_insentive.employee_id, status: @employee_insentive.status }
    assert_redirected_to employee_insentive_path(assigns(:employee_insentive))
  end

  test "should destroy employee_insentive" do
    assert_difference('EmployeeInsentive.count', -1) do
      delete :destroy, id: @employee_insentive
    end

    assert_redirected_to employee_insentives_path
  end
end
