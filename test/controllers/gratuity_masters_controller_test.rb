require 'test_helper'

class GratuityMastersControllerTest < ActionController::TestCase
  setup do
    @gratuity_master = gratuity_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gratuity_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gratuity_master" do
    assert_difference('GratuityMaster.count') do
      post :create, gratuity_master: { base_component: @gratuity_master.base_component, day_in_month: @gratuity_master.day_in_month, is_active: @gratuity_master.is_active, is_confirm: @gratuity_master.is_confirm, no_of_year: @gratuity_master.no_of_year, payable_day: @gratuity_master.payable_day }
    end

    assert_redirected_to gratuity_master_path(assigns(:gratuity_master))
  end

  test "should show gratuity_master" do
    get :show, id: @gratuity_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gratuity_master
    assert_response :success
  end

  test "should update gratuity_master" do
    patch :update, id: @gratuity_master, gratuity_master: { base_component: @gratuity_master.base_component, day_in_month: @gratuity_master.day_in_month, is_active: @gratuity_master.is_active, is_confirm: @gratuity_master.is_confirm, no_of_year: @gratuity_master.no_of_year, payable_day: @gratuity_master.payable_day }
    assert_redirected_to gratuity_master_path(assigns(:gratuity_master))
  end

  test "should destroy gratuity_master" do
    assert_difference('GratuityMaster.count', -1) do
      delete :destroy, id: @gratuity_master
    end

    assert_redirected_to gratuity_masters_path
  end
end
