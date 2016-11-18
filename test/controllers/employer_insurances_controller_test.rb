require 'test_helper'

class EmployerInsurancesControllerTest < ActionController::TestCase
  setup do
    @employer_insurance = employer_insurances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employer_insurances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employer_insurance" do
    assert_difference('EmployerInsurance.count') do
      post :create, employer_insurance: { base_component: @employer_insurance.base_component, effective_from: @employer_insurance.effective_from, effective_to: @employer_insurance.effective_to, is_active: @employer_insurance.is_active, is_confirm: @employer_insurance.is_confirm, percentage: @employer_insurance.percentage }
    end

    assert_redirected_to employer_insurance_path(assigns(:employer_insurance))
  end

  test "should show employer_insurance" do
    get :show, id: @employer_insurance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employer_insurance
    assert_response :success
  end

  test "should update employer_insurance" do
    patch :update, id: @employer_insurance, employer_insurance: { base_component: @employer_insurance.base_component, effective_from: @employer_insurance.effective_from, effective_to: @employer_insurance.effective_to, is_active: @employer_insurance.is_active, is_confirm: @employer_insurance.is_confirm, percentage: @employer_insurance.percentage }
    assert_redirected_to employer_insurance_path(assigns(:employer_insurance))
  end

  test "should destroy employer_insurance" do
    assert_difference('EmployerInsurance.count', -1) do
      delete :destroy, id: @employer_insurance
    end

    assert_redirected_to employer_insurances_path
  end
end
