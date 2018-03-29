require 'test_helper'

class ProfessionalTaxMastersControllerTest < ActionController::TestCase
  setup do
    @professional_tax_master = professional_tax_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:professional_tax_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create professional_tax_master" do
    assert_difference('ProfessionalTaxMaster.count') do
      post :create, professional_tax_master: { base_component: @professional_tax_master.base_component, effective_from: @professional_tax_master.effective_from, effective_to: @professional_tax_master.effective_to, for_month: @professional_tax_master.for_month, is_active: @professional_tax_master.is_active, is_confirm: @professional_tax_master.is_confirm, march_amount: @professional_tax_master.march_amount, max_amount: @professional_tax_master.max_amount, min_amount: @professional_tax_master.min_amount }
    end

    assert_redirected_to professional_tax_master_path(assigns(:professional_tax_master))
  end

  test "should show professional_tax_master" do
    get :show, id: @professional_tax_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @professional_tax_master
    assert_response :success
  end

  test "should update professional_tax_master" do
    patch :update, id: @professional_tax_master, professional_tax_master: { base_component: @professional_tax_master.base_component, effective_from: @professional_tax_master.effective_from, effective_to: @professional_tax_master.effective_to, for_month: @professional_tax_master.for_month, is_active: @professional_tax_master.is_active, is_confirm: @professional_tax_master.is_confirm, march_amount: @professional_tax_master.march_amount, max_amount: @professional_tax_master.max_amount, min_amount: @professional_tax_master.min_amount }
    assert_redirected_to professional_tax_master_path(assigns(:professional_tax_master))
  end

  test "should destroy professional_tax_master" do
    assert_difference('ProfessionalTaxMaster.count', -1) do
      delete :destroy, id: @professional_tax_master
    end

    assert_redirected_to professional_tax_masters_path
  end
end
