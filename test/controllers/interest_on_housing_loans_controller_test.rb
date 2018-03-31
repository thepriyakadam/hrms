require 'test_helper'

class InterestOnHousingLoansControllerTest < ActionController::TestCase
  setup do
    @interest_on_housing_loan = interest_on_housing_loans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interest_on_housing_loans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interest_on_housing_loan" do
    assert_difference('InterestOnHousingLoan.count') do
      post :create, interest_on_housing_loan: { actual_interest: @interest_on_housing_loan.actual_interest, date_of_possession: @interest_on_housing_loan.date_of_possession, estimated_interest: @interest_on_housing_loan.estimated_interest, investment_declaration_id: @interest_on_housing_loan.investment_declaration_id, lender_address: @interest_on_housing_loan.lender_address, lender_name: @interest_on_housing_loan.lender_name, lender_pan_no: @interest_on_housing_loan.lender_pan_no, property_address: @interest_on_housing_loan.property_address, property_name: @interest_on_housing_loan.property_name, total_interest: @interest_on_housing_loan.total_interest }
    end

    assert_redirected_to interest_on_housing_loan_path(assigns(:interest_on_housing_loan))
  end

  test "should show interest_on_housing_loan" do
    get :show, id: @interest_on_housing_loan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @interest_on_housing_loan
    assert_response :success
  end

  test "should update interest_on_housing_loan" do
    patch :update, id: @interest_on_housing_loan, interest_on_housing_loan: { actual_interest: @interest_on_housing_loan.actual_interest, date_of_possession: @interest_on_housing_loan.date_of_possession, estimated_interest: @interest_on_housing_loan.estimated_interest, investment_declaration_id: @interest_on_housing_loan.investment_declaration_id, lender_address: @interest_on_housing_loan.lender_address, lender_name: @interest_on_housing_loan.lender_name, lender_pan_no: @interest_on_housing_loan.lender_pan_no, property_address: @interest_on_housing_loan.property_address, property_name: @interest_on_housing_loan.property_name, total_interest: @interest_on_housing_loan.total_interest }
    assert_redirected_to interest_on_housing_loan_path(assigns(:interest_on_housing_loan))
  end

  test "should destroy interest_on_housing_loan" do
    assert_difference('InterestOnHousingLoan.count', -1) do
      delete :destroy, id: @interest_on_housing_loan
    end

    assert_redirected_to interest_on_housing_loans_path
  end
end
