require 'test_helper'

class InsuranceMastersControllerTest < ActionController::TestCase
  setup do
    @insurance_master = insurance_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insurance_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insurance_master" do
    assert_difference('InsuranceMaster.count') do
      post :create, insurance_master: { base_component: @insurance_master.base_component, effective_from: @insurance_master.effective_from, effective_to: @insurance_master.effective_to, is_active: @insurance_master.is_active, is_confirm: @insurance_master.is_confirm, is_insurance: @insurance_master.is_insurance, percentage: @insurance_master.percentage }
    end

    assert_redirected_to insurance_master_path(assigns(:insurance_master))
  end

  test "should show insurance_master" do
    get :show, id: @insurance_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @insurance_master
    assert_response :success
  end

  test "should update insurance_master" do
    patch :update, id: @insurance_master, insurance_master: { base_component: @insurance_master.base_component, effective_from: @insurance_master.effective_from, effective_to: @insurance_master.effective_to, is_active: @insurance_master.is_active, is_confirm: @insurance_master.is_confirm, is_insurance: @insurance_master.is_insurance, percentage: @insurance_master.percentage }
    assert_redirected_to insurance_master_path(assigns(:insurance_master))
  end

  test "should destroy insurance_master" do
    assert_difference('InsuranceMaster.count', -1) do
      delete :destroy, id: @insurance_master
    end

    assert_redirected_to insurance_masters_path
  end
end
