require 'test_helper'

class MonthlyIncomeTaxesControllerTest < ActionController::TestCase
  setup do
    @monthly_income_tax = monthly_income_taxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monthly_income_taxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monthly_income_tax" do
    assert_difference('MonthlyIncomeTax.count') do
      post :create, monthly_income_tax: { bsr_code: @monthly_income_tax.bsr_code, challan_no: @monthly_income_tax.challan_no, date: @monthly_income_tax.date, status: @monthly_income_tax.status, tax_deposited: @monthly_income_tax.tax_deposited }
    end

    assert_redirected_to monthly_income_tax_path(assigns(:monthly_income_tax))
  end

  test "should show monthly_income_tax" do
    get :show, id: @monthly_income_tax
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monthly_income_tax
    assert_response :success
  end

  test "should update monthly_income_tax" do
    patch :update, id: @monthly_income_tax, monthly_income_tax: { bsr_code: @monthly_income_tax.bsr_code, challan_no: @monthly_income_tax.challan_no, date: @monthly_income_tax.date, status: @monthly_income_tax.status, tax_deposited: @monthly_income_tax.tax_deposited }
    assert_redirected_to monthly_income_tax_path(assigns(:monthly_income_tax))
  end

  test "should destroy monthly_income_tax" do
    assert_difference('MonthlyIncomeTax.count', -1) do
      delete :destroy, id: @monthly_income_tax
    end

    assert_redirected_to monthly_income_taxes_path
  end
end
