require 'test_helper'

class LoanRequestsControllerTest < ActionController::TestCase
  setup do
    @loan_request = loan_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loan_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loan_request" do
    assert_difference('LoanRequest.count') do
      post :create, loan_request: { date: @loan_request.date, emi: @loan_request.emi, loan_type_id: @loan_request.loan_type_id, membership_id: @loan_request.membership_id }
    end

    assert_redirected_to loan_request_path(assigns(:loan_request))
  end

  test "should show loan_request" do
    get :show, id: @loan_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loan_request
    assert_response :success
  end

  test "should update loan_request" do
    patch :update, id: @loan_request, loan_request: { date: @loan_request.date, emi: @loan_request.emi, loan_type_id: @loan_request.loan_type_id, membership_id: @loan_request.membership_id }
    assert_redirected_to loan_request_path(assigns(:loan_request))
  end

  test "should destroy loan_request" do
    assert_difference('LoanRequest.count', -1) do
      delete :destroy, id: @loan_request
    end

    assert_redirected_to loan_requests_path
  end
end
