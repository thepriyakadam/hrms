require 'test_helper'

class EmployeeDesignationsControllerTest < ActionController::TestCase
  setup do
    @employee_designation = employee_designations(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_designations)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create employee_designation' do
    assert_difference('EmployeeDesignation.count') do
      post :create, employee_designation: { name: @employee_designation.name }
    end

    assert_redirected_to employee_designation_path(assigns(:employee_designation))
  end

  test 'should show employee_designation' do
    get :show, id: @employee_designation
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @employee_designation
    assert_response :success
  end

  test 'should update employee_designation' do
    patch :update, id: @employee_designation, employee_designation: { name: @employee_designation.name }
    assert_redirected_to employee_designation_path(assigns(:employee_designation))
  end

  test 'should destroy employee_designation' do
    assert_difference('EmployeeDesignation.count', -1) do
      delete :destroy, id: @employee_designation
    end

    assert_redirected_to employee_designations_path
  end
end
