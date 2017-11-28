require 'test_helper'

class EmployeeBankDetailsControllerTest < ActionController::TestCase
  setup do
    @employee_bank_detail = employee_bank_details(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:employee_bank_details)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create employee_bank_detail' do
    assert_difference('EmployeeBankDetail.count') do
      post :create, employee_bank_detail: { account_no: @employee_bank_detail.account_no, address: @employee_bank_detail.address, bank_name: @employee_bank_detail.bank_name, branch_code: @employee_bank_detail.branch_code, branch_name: @employee_bank_detail.branch_name, contact_no: @employee_bank_detail.contact_no, employee_id: @employee_bank_detail.employee_id, ifsc_code: @employee_bank_detail.ifsc_code, micr_code: @employee_bank_detail.micr_code }
    end

    assert_redirected_to employee_bank_detail_path(assigns(:employee_bank_detail))
  end

  test 'should show employee_bank_detail' do
    get :show, id: @employee_bank_detail
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @employee_bank_detail
    assert_response :success
  end

  test 'should update employee_bank_detail' do
    patch :update, id: @employee_bank_detail, employee_bank_detail: { account_no: @employee_bank_detail.account_no, address: @employee_bank_detail.address, bank_name: @employee_bank_detail.bank_name, branch_code: @employee_bank_detail.branch_code, branch_name: @employee_bank_detail.branch_name, contact_no: @employee_bank_detail.contact_no, employee_id: @employee_bank_detail.employee_id, ifsc_code: @employee_bank_detail.ifsc_code, micr_code: @employee_bank_detail.micr_code }
    assert_redirected_to employee_bank_detail_path(assigns(:employee_bank_detail))
  end

  test 'should destroy employee_bank_detail' do
    assert_difference('EmployeeBankDetail.count', -1) do
      delete :destroy, id: @employee_bank_detail
    end

    assert_redirected_to employee_bank_details_path
  end
end
