require 'test_helper'

class LeaveTransfersControllerTest < ActionController::TestCase
  setup do
    @leave_transfer = leave_transfers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_transfers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leave_transfer" do
    assert_difference('LeaveTransfer.count') do
      post :create, leave_transfer: { date: @leave_transfer.date, employee_id: @leave_transfer.employee_id, employee_leav_balance_id: @leave_transfer.employee_leav_balance_id, no_of_leave: @leave_transfer.no_of_leave, status: @leave_transfer.status, transfer_to_id: @leave_transfer.transfer_to_id }
    end

    assert_redirected_to leave_transfer_path(assigns(:leave_transfer))
  end

  test "should show leave_transfer" do
    get :show, id: @leave_transfer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leave_transfer
    assert_response :success
  end

  test "should update leave_transfer" do
    patch :update, id: @leave_transfer, leave_transfer: { date: @leave_transfer.date, employee_id: @leave_transfer.employee_id, employee_leav_balance_id: @leave_transfer.employee_leav_balance_id, no_of_leave: @leave_transfer.no_of_leave, status: @leave_transfer.status, transfer_to_id: @leave_transfer.transfer_to_id }
    assert_redirected_to leave_transfer_path(assigns(:leave_transfer))
  end

  test "should destroy leave_transfer" do
    assert_difference('LeaveTransfer.count', -1) do
      delete :destroy, id: @leave_transfer
    end

    assert_redirected_to leave_transfers_path
  end
end
