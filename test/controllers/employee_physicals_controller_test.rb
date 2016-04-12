require 'test_helper'

class EmployeePhysicalsControllerTest < ActionController::TestCase
  setup do
    @employee_physical = employee_physicals(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_physicals)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create employee_physical' do
    assert_difference('EmployeePhysical.count') do
      post :create, employee_physical: { employee_id: @employee_physical.employee_id, hieght: @employee_physical.hieght, size: @employee_physical.size, weight: @employee_physical.weight }
    end

    assert_redirected_to employee_physical_path(assigns(:employee_physical))
  end

  test 'should show employee_physical' do
    get :show, id: @employee_physical
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @employee_physical
    assert_response :success
  end

  test 'should update employee_physical' do
    patch :update, id: @employee_physical, employee_physical: { employee_id: @employee_physical.employee_id, hieght: @employee_physical.hieght, size: @employee_physical.size, weight: @employee_physical.weight }
    assert_redirected_to employee_physical_path(assigns(:employee_physical))
  end

  test 'should destroy employee_physical' do
    assert_difference('EmployeePhysical.count', -1) do
      delete :destroy, id: @employee_physical
    end

    assert_redirected_to employee_physicals_path
  end
end
