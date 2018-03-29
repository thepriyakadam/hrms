require 'test_helper'

class LoanEmisControllerTest < ActionController::TestCase
  setup do
    @loan_emi = loan_emis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loan_emis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loan_emi" do
    assert_difference('LoanEmi.count') do
      post :create, loan_emi: { date: @loan_emi.date, emi_amount: @loan_emi.emi_amount, loan_approval_id: @loan_emi.loan_approval_id, status: @loan_emi.status }
    end

    assert_redirected_to loan_emi_path(assigns(:loan_emi))
  end

  test "should show loan_emi" do
    get :show, id: @loan_emi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loan_emi
    assert_response :success
  end

  test "should update loan_emi" do
    patch :update, id: @loan_emi, loan_emi: { date: @loan_emi.date, emi_amount: @loan_emi.emi_amount, loan_approval_id: @loan_emi.loan_approval_id, status: @loan_emi.status }
    assert_redirected_to loan_emi_path(assigns(:loan_emi))
  end

  test "should destroy loan_emi" do
    assert_difference('LoanEmi.count', -1) do
      delete :destroy, id: @loan_emi
    end

    assert_redirected_to loan_emis_path
  end
end
