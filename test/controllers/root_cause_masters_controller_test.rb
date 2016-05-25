require 'test_helper'

class RootCauseMastersControllerTest < ActionController::TestCase
  setup do
    @root_cause_master = root_cause_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:root_cause_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create root_cause_master" do
    assert_difference('RootCauseMaster.count') do
      post :create, root_cause_master: { code: @root_cause_master.code, description: @root_cause_master.description, name: @root_cause_master.name }
    end

    assert_redirected_to root_cause_master_path(assigns(:root_cause_master))
  end

  test "should show root_cause_master" do
    get :show, id: @root_cause_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @root_cause_master
    assert_response :success
  end

  test "should update root_cause_master" do
    patch :update, id: @root_cause_master, root_cause_master: { code: @root_cause_master.code, description: @root_cause_master.description, name: @root_cause_master.name }
    assert_redirected_to root_cause_master_path(assigns(:root_cause_master))
  end

  test "should destroy root_cause_master" do
    assert_difference('RootCauseMaster.count', -1) do
      delete :destroy, id: @root_cause_master
    end

    assert_redirected_to root_cause_masters_path
  end
end
