require 'test_helper'

class EmployeeShiftsControllerTest < ActionController::TestCase
  setup do
    @employee_shift = employee_shifts(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_shifts)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create employee_shift' do
    assert_difference('EmployeeShift.count') do
      post :create, employee_shift: { company_shift_id: @employee_shift.company_shift_id, employee_id: @employee_shift.employee_id }
    end

    assert_redirected_to employee_shift_path(assigns(:employee_shift))
  end

  test 'should show employee_shift' do
    get :show, id: @employee_shift
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @employee_shift
    assert_response :success
  end

  test 'should update employee_shift' do
    patch :update, id: @employee_shift, employee_shift: { company_shift_id: @employee_shift.company_shift_id, employee_id: @employee_shift.employee_id }
    assert_redirected_to employee_shift_path(assigns(:employee_shift))
  end

  test 'should destroy employee_shift' do
    assert_difference('EmployeeShift.count', -1) do
      delete :destroy, id: @employee_shift
    end

    assert_redirected_to employee_shifts_path
  end
end
