require 'test_helper'

class CurrencyMastersControllerTest < ActionController::TestCase
  setup do
    @currency_master = currency_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:currency_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create currency_master" do
    assert_difference('CurrencyMaster.count') do
      post :create, currency_master: { code: @currency_master.code, description: @currency_master.description, name: @currency_master.name }
    end

    assert_redirected_to currency_master_path(assigns(:currency_master))
  end

  test "should show currency_master" do
    get :show, id: @currency_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @currency_master
    assert_response :success
  end

  test "should update currency_master" do
    patch :update, id: @currency_master, currency_master: { code: @currency_master.code, description: @currency_master.description, name: @currency_master.name }
    assert_redirected_to currency_master_path(assigns(:currency_master))
  end

  test "should destroy currency_master" do
    assert_difference('CurrencyMaster.count', -1) do
      delete :destroy, id: @currency_master
    end

    assert_redirected_to currency_masters_path
  end
end
