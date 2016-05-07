require 'test_helper'

class NominationMastersControllerTest < ActionController::TestCase
  setup do
    @nomination_master = nomination_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nomination_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nomination_master" do
    assert_difference('NominationMaster.count') do
      post :create, nomination_master: { code: @nomination_master.code, description: @nomination_master.description, name: @nomination_master.name }
    end

    assert_redirected_to nomination_master_path(assigns(:nomination_master))
  end

  test "should show nomination_master" do
    get :show, id: @nomination_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nomination_master
    assert_response :success
  end

  test "should update nomination_master" do
    patch :update, id: @nomination_master, nomination_master: { code: @nomination_master.code, description: @nomination_master.description, name: @nomination_master.name }
    assert_redirected_to nomination_master_path(assigns(:nomination_master))
  end

  test "should destroy nomination_master" do
    assert_difference('NominationMaster.count', -1) do
      delete :destroy, id: @nomination_master
    end

    assert_redirected_to nomination_masters_path
  end
end
