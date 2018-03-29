require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    @employee = employees(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create employee' do
    assert_difference('Employee.count') do
      post :create, employee: { adhar_no: @employee.adhar_no, blood_group_id: @employee.blood_group_id, city: @employee.city, contact_no: @employee.contact_no, current_address: @employee.current_address, date_of_birth: @employee.date_of_birth, department_id: @employee.department_id, district: @employee.district, email: @employee.email, employee_type_id: @employee.employee_type_id, first_name: @employee.first_name, gender: @employee.gender, handicap: @employee.handicap, last_name: @employee.last_name, licence_no: @employee.licence_no, marital_status: @employee.marital_status, middle_name: @employee.middle_name, nationality_id: @employee.nationality_id, pan_no: @employee.pan_no, passport_no: @employee.passport_no, permanent_address: @employee.permanent_address, pin_code: @employee.pin_code, state: @employee.state, status: @employee.status }
    end

    assert_redirected_to employee_path(assigns(:employee))
  end

  test 'should show employee' do
    get :show, id: @employee
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @employee
    assert_response :success
  end

  test 'should update employee' do
    patch :update, id: @employee, employee: { adhar_no: @employee.adhar_no, blood_group_id: @employee.blood_group_id, city: @employee.city, contact_no: @employee.contact_no, current_address: @employee.current_address, date_of_birth: @employee.date_of_birth, department_id: @employee.department_id, district: @employee.district, email: @employee.email, employee_type_id: @employee.employee_type_id, first_name: @employee.first_name, gender: @employee.gender, handicap: @employee.handicap, last_name: @employee.last_name, licence_no: @employee.licence_no, marital_status: @employee.marital_status, middle_name: @employee.middle_name, nationality_id: @employee.nationality_id, pan_no: @employee.pan_no, passport_no: @employee.passport_no, permanent_address: @employee.permanent_address, pin_code: @employee.pin_code, state: @employee.state, status: @employee.status }
    assert_redirected_to employee_path(assigns(:employee))
  end

  test 'should destroy employee' do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end

    assert_redirected_to employees_path
  end
end
