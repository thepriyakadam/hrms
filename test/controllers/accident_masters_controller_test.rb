require 'test_helper'

class AccidentMastersControllerTest < ActionController::TestCase
  setup do
    @accident_master = accident_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accident_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accident_master" do
    assert_difference('AccidentMaster.count') do
      post :create, accident_master: { code: @accident_master.code, description: @accident_master.description, name: @accident_master.name }
    end

    assert_redirected_to accident_master_path(assigns(:accident_master))
  end

  test "should show accident_master" do
    get :show, id: @accident_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accident_master
    assert_response :success
  end

  test "should update accident_master" do
    patch :update, id: @accident_master, accident_master: { code: @accident_master.code, description: @accident_master.description, name: @accident_master.name }
    assert_redirected_to accident_master_path(assigns(:accident_master))
  end

  test "should destroy accident_master" do
    assert_difference('AccidentMaster.count', -1) do
      delete :destroy, id: @accident_master
    end

    assert_redirected_to accident_masters_path
  end
end
