require 'test_helper'

class ShortLeaveApprovalsControllerTest < ActionController::TestCase
  setup do
    @short_leave_approval = short_leave_approvals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:short_leave_approvals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create short_leave_approval" do
    assert_difference('ShortLeaveApproval.count') do
      post :create, short_leave_approval: { employee_id: @short_leave_approval.employee_id, short_leave_request_id: @short_leave_approval.short_leave_request_id, status: @short_leave_approval.status }
    end

    assert_redirected_to short_leave_approval_path(assigns(:short_leave_approval))
  end

  test "should show short_leave_approval" do
    get :show, id: @short_leave_approval
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @short_leave_approval
    assert_response :success
  end

  test "should update short_leave_approval" do
    patch :update, id: @short_leave_approval, short_leave_approval: { employee_id: @short_leave_approval.employee_id, short_leave_request_id: @short_leave_approval.short_leave_request_id, status: @short_leave_approval.status }
    assert_redirected_to short_leave_approval_path(assigns(:short_leave_approval))
  end

  test "should destroy short_leave_approval" do
    assert_difference('ShortLeaveApproval.count', -1) do
      delete :destroy, id: @short_leave_approval
    end

    assert_redirected_to short_leave_approvals_path
  end
end
