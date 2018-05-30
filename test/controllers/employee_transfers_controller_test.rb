require 'test_helper'

class EmployeeTransfersControllerTest < ActionController::TestCase
  setup do
    @employee_transfer = employee_transfers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_transfers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee_transfer" do
    assert_difference('EmployeeTransfer.count') do
      post :create, employee_transfer: { company_id: @employee_transfer.company_id, company_location_id: @employee_transfer.company_location_id, department_id: @employee_transfer.department_id, employee_category_id: @employee_transfer.employee_category_id, employee_designation_id: @employee_transfer.employee_designation_id, employee_id: @employee_transfer.employee_id, justification: @employee_transfer.justification, reporting_master_id: @employee_transfer.reporting_master_id }
    end

    assert_redirected_to employee_transfer_path(assigns(:employee_transfer))
  end

  test "should show employee_transfer" do
    get :show, id: @employee_transfer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee_transfer
    assert_response :success
  end

  test "should update employee_transfer" do
    patch :update, id: @employee_transfer, employee_transfer: { company_id: @employee_transfer.company_id, company_location_id: @employee_transfer.company_location_id, department_id: @employee_transfer.department_id, employee_category_id: @employee_transfer.employee_category_id, employee_designation_id: @employee_transfer.employee_designation_id, employee_id: @employee_transfer.employee_id, justification: @employee_transfer.justification, reporting_master_id: @employee_transfer.reporting_master_id }
    assert_redirected_to employee_transfer_path(assigns(:employee_transfer))
  end

  test "should destroy employee_transfer" do
    assert_difference('EmployeeTransfer.count', -1) do
      delete :destroy, id: @employee_transfer
    end

    assert_redirected_to employee_transfers_path
  end
end
