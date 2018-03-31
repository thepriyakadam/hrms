require 'test_helper'

class DepartmentsControllerTest < ActionController::TestCase
  setup do
    @department = departments(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:departments)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create department' do
    assert_difference('Department.count') do
      post :create, department: { address: @department.address, company_location_id: @department.company_location_id, contact_no: @department.contact_no, department_type: @department.department_type, head_of_department: @department.head_of_department, hr: @department.hr, manager: @department.manager, name: @department.name, pin_code: @department.pin_code }
    end

    assert_redirected_to department_path(assigns(:department))
  end

  test 'should show department' do
    get :show, id: @department
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @department
    assert_response :success
  end

  test 'should update department' do
    patch :update, id: @department, department: { address: @department.address, company_location_id: @department.company_location_id, contact_no: @department.contact_no, department_type: @department.department_type, head_of_department: @department.head_of_department, hr: @department.hr, manager: @department.manager, name: @department.name, pin_code: @department.pin_code }
    assert_redirected_to department_path(assigns(:department))
  end

  test 'should destroy department' do
    assert_difference('Department.count', -1) do
      delete :destroy, id: @department
    end

    assert_redirected_to departments_path
  end
end
