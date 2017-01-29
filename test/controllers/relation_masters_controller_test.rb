require 'test_helper'

class RelationMastersControllerTest < ActionController::TestCase
  setup do
    @relation_master = relation_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relation_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relation_master" do
    assert_difference('RelationMaster.count') do
      post :create, relation_master: { code: @relation_master.code, description: @relation_master.description, name: @relation_master.name }
    end

    assert_redirected_to relation_master_path(assigns(:relation_master))
  end

  test "should show relation_master" do
    get :show, id: @relation_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @relation_master
    assert_response :success
  end

  test "should update relation_master" do
    patch :update, id: @relation_master, relation_master: { code: @relation_master.code, description: @relation_master.description, name: @relation_master.name }
    assert_redirected_to relation_master_path(assigns(:relation_master))
  end

  test "should destroy relation_master" do
    assert_difference('RelationMaster.count', -1) do
      delete :destroy, id: @relation_master
    end

    assert_redirected_to relation_masters_path
  end
end
