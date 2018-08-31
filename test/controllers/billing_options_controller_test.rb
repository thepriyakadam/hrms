require 'test_helper'

class BillingOptionsControllerTest < ActionController::TestCase
  setup do
    @billing_option = billing_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:billing_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create billing_option" do
    assert_difference('BillingOption.count') do
      post :create, billing_option: { code: @billing_option.code, description: @billing_option.description, expence_opestion_id: @billing_option.expence_opestion_id, name: @billing_option.name, status: @billing_option.status }
    end

    assert_redirected_to billing_option_path(assigns(:billing_option))
  end

  test "should show billing_option" do
    get :show, id: @billing_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @billing_option
    assert_response :success
  end

  test "should update billing_option" do
    patch :update, id: @billing_option, billing_option: { code: @billing_option.code, description: @billing_option.description, expence_opestion_id: @billing_option.expence_opestion_id, name: @billing_option.name, status: @billing_option.status }
    assert_redirected_to billing_option_path(assigns(:billing_option))
  end

  test "should destroy billing_option" do
    assert_difference('BillingOption.count', -1) do
      delete :destroy, id: @billing_option
    end

    assert_redirected_to billing_options_path
  end
end
