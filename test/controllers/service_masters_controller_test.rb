require 'test_helper'

class ServiceMastersControllerTest < ActionController::TestCase
  setup do
    @service_master = service_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:service_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create service_master" do
    assert_difference('ServiceMaster.count') do
      post :create, service_master: { code: @service_master.code, description: @service_master.description, name: @service_master.name, status: @service_master.status }
    end

    assert_redirected_to service_master_path(assigns(:service_master))
  end

  test "should show service_master" do
    get :show, id: @service_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @service_master
    assert_response :success
  end

  test "should update service_master" do
    patch :update, id: @service_master, service_master: { code: @service_master.code, description: @service_master.description, name: @service_master.name, status: @service_master.status }
    assert_redirected_to service_master_path(assigns(:service_master))
  end

  test "should destroy service_master" do
    assert_difference('ServiceMaster.count', -1) do
      delete :destroy, id: @service_master
    end

    assert_redirected_to service_masters_path
  end
end
