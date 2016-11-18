require 'test_helper'

class DaMastersControllerTest < ActionController::TestCase
  setup do
    @da_master = da_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:da_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create da_master" do
    assert_difference('DaMaster.count') do
      post :create, da_master: { effective_from: @da_master.effective_from, effective_to: @da_master.effective_to, is_active: @da_master.is_active, is_confirm: @da_master.is_confirm, is_da: @da_master.is_da, minimum_wages: @da_master.minimum_wages }
    end

    assert_redirected_to da_master_path(assigns(:da_master))
  end

  test "should show da_master" do
    get :show, id: @da_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @da_master
    assert_response :success
  end

  test "should update da_master" do
    patch :update, id: @da_master, da_master: { effective_from: @da_master.effective_from, effective_to: @da_master.effective_to, is_active: @da_master.is_active, is_confirm: @da_master.is_confirm, is_da: @da_master.is_da, minimum_wages: @da_master.minimum_wages }
    assert_redirected_to da_master_path(assigns(:da_master))
  end

  test "should destroy da_master" do
    assert_difference('DaMaster.count', -1) do
      delete :destroy, id: @da_master
    end

    assert_redirected_to da_masters_path
  end
end
