require 'test_helper'

class ResourcePoolMastersControllerTest < ActionController::TestCase
  setup do
    @resource_pool_master = resource_pool_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resource_pool_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resource_pool_master" do
    assert_difference('ResourcePoolMaster.count') do
      post :create, resource_pool_master: { code: @resource_pool_master.code, description: @resource_pool_master.description, name: @resource_pool_master.name, status: @resource_pool_master.status }
    end

    assert_redirected_to resource_pool_master_path(assigns(:resource_pool_master))
  end

  test "should show resource_pool_master" do
    get :show, id: @resource_pool_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resource_pool_master
    assert_response :success
  end

  test "should update resource_pool_master" do
    patch :update, id: @resource_pool_master, resource_pool_master: { code: @resource_pool_master.code, description: @resource_pool_master.description, name: @resource_pool_master.name, status: @resource_pool_master.status }
    assert_redirected_to resource_pool_master_path(assigns(:resource_pool_master))
  end

  test "should destroy resource_pool_master" do
    assert_difference('ResourcePoolMaster.count', -1) do
      delete :destroy, id: @resource_pool_master
    end

    assert_redirected_to resource_pool_masters_path
  end
end
