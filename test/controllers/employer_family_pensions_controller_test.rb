require 'test_helper'

class EmployerFamilyPensionsControllerTest < ActionController::TestCase
  setup do
    @employer_family_pension = employer_family_pensions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employer_family_pensions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employer_family_pension" do
    assert_difference('EmployerFamilyPension.count') do
      post :create, employer_family_pension: { base_component: @employer_family_pension.base_component, effective_from: @employer_family_pension.effective_from, effective_to: @employer_family_pension.effective_to, is_active: @employer_family_pension.is_active, is_confirm: @employer_family_pension.is_confirm, percentage: @employer_family_pension.percentage }
    end

    assert_redirected_to employer_family_pension_path(assigns(:employer_family_pension))
  end

  test "should show employer_family_pension" do
    get :show, id: @employer_family_pension
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employer_family_pension
    assert_response :success
  end

  test "should update employer_family_pension" do
    patch :update, id: @employer_family_pension, employer_family_pension: { base_component: @employer_family_pension.base_component, effective_from: @employer_family_pension.effective_from, effective_to: @employer_family_pension.effective_to, is_active: @employer_family_pension.is_active, is_confirm: @employer_family_pension.is_confirm, percentage: @employer_family_pension.percentage }
    assert_redirected_to employer_family_pension_path(assigns(:employer_family_pension))
  end

  test "should destroy employer_family_pension" do
    assert_difference('EmployerFamilyPension.count', -1) do
      delete :destroy, id: @employer_family_pension
    end

    assert_redirected_to employer_family_pensions_path
  end
end
