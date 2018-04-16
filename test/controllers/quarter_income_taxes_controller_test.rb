require 'test_helper'

class QuarterIncomeTaxesControllerTest < ActionController::TestCase
  setup do
    @quarter_income_tax = quarter_income_taxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quarter_income_taxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quarter_income_tax" do
    assert_difference('QuarterIncomeTax.count') do
      post :create, quarter_income_tax: { date: @quarter_income_tax.date, paid_amount: @quarter_income_tax.paid_amount, quarter: @quarter_income_tax.quarter, reciept_no: @quarter_income_tax.reciept_no, tax_amount_deducted: @quarter_income_tax.tax_amount_deducted, tax_amount_deposited: @quarter_income_tax.tax_amount_deposited }
    end

    assert_redirected_to quarter_income_tax_path(assigns(:quarter_income_tax))
  end

  test "should show quarter_income_tax" do
    get :show, id: @quarter_income_tax
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quarter_income_tax
    assert_response :success
  end

  test "should update quarter_income_tax" do
    patch :update, id: @quarter_income_tax, quarter_income_tax: { date: @quarter_income_tax.date, paid_amount: @quarter_income_tax.paid_amount, quarter: @quarter_income_tax.quarter, reciept_no: @quarter_income_tax.reciept_no, tax_amount_deducted: @quarter_income_tax.tax_amount_deducted, tax_amount_deposited: @quarter_income_tax.tax_amount_deposited }
    assert_redirected_to quarter_income_tax_path(assigns(:quarter_income_tax))
  end

  test "should destroy quarter_income_tax" do
    assert_difference('QuarterIncomeTax.count', -1) do
      delete :destroy, id: @quarter_income_tax
    end

    assert_redirected_to quarter_income_taxes_path
  end
end
