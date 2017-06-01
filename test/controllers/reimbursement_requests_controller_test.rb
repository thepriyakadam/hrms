require 'test_helper'

class ReimbursementRequestsControllerTest < ActionController::TestCase
  setup do
    @reimbursement_request = reimbursement_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reimbursement_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reimbursement_request" do
    assert_difference('ReimbursementRequest.count') do
      post :create, reimbursement_request: { amount: @reimbursement_request.amount, approval_id: @reimbursement_request.approval_id, date: @reimbursement_request.date, employee_id: @reimbursement_request.employee_id, reimbursement_head_id: @reimbursement_request.reimbursement_head_id, status: @reimbursement_request.status }
    end

    assert_redirected_to reimbursement_request_path(assigns(:reimbursement_request))
  end

  test "should show reimbursement_request" do
    get :show, id: @reimbursement_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reimbursement_request
    assert_response :success
  end

  test "should update reimbursement_request" do
    patch :update, id: @reimbursement_request, reimbursement_request: { amount: @reimbursement_request.amount, approval_id: @reimbursement_request.approval_id, date: @reimbursement_request.date, employee_id: @reimbursement_request.employee_id, reimbursement_head_id: @reimbursement_request.reimbursement_head_id, status: @reimbursement_request.status }
    assert_redirected_to reimbursement_request_path(assigns(:reimbursement_request))
  end

  test "should destroy reimbursement_request" do
    assert_difference('ReimbursementRequest.count', -1) do
      delete :destroy, id: @reimbursement_request
    end

    assert_redirected_to reimbursement_requests_path
  end
end
