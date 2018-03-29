require 'test_helper'

class ProfessionalTaxesControllerTest < ActionController::TestCase
  setup do
    @professional_tax = professional_taxes(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:professional_taxes)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create professional_tax' do
    assert_difference('ProfessionalTax.count') do
      post :create, professional_tax: { for_months: @professional_tax.for_months, is_pt: @professional_tax.is_pt, march_month: @professional_tax.march_month, max_salary: @professional_tax.max_salary, min_salary: @professional_tax.min_salary, pt_amount: @professional_tax.pt_amount }
    end

    assert_redirected_to professional_tax_path(assigns(:professional_tax))
  end

  test 'should show professional_tax' do
    get :show, id: @professional_tax
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @professional_tax
    assert_response :success
  end

  test 'should update professional_tax' do
    patch :update, id: @professional_tax, professional_tax: { for_months: @professional_tax.for_months, is_pt: @professional_tax.is_pt, march_month: @professional_tax.march_month, max_salary: @professional_tax.max_salary, min_salary: @professional_tax.min_salary, pt_amount: @professional_tax.pt_amount }
    assert_redirected_to professional_tax_path(assigns(:professional_tax))
  end

  test 'should destroy professional_tax' do
    assert_difference('ProfessionalTax.count', -1) do
      delete :destroy, id: @professional_tax
    end

    assert_redirected_to professional_taxes_path
  end
end
