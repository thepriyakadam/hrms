require 'test_helper'

class AttributeMastersControllerTest < ActionController::TestCase
  setup do
    @attribute_master = attribute_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attribute_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attribute_master" do
    assert_difference('AttributeMaster.count') do
      post :create, attribute_master: { code: @attribute_master.code, definition: @attribute_master.definition, name: @attribute_master.name, status: @attribute_master.status }
    end

    assert_redirected_to attribute_master_path(assigns(:attribute_master))
  end

  test "should show attribute_master" do
    get :show, id: @attribute_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attribute_master
    assert_response :success
  end

  test "should update attribute_master" do
    patch :update, id: @attribute_master, attribute_master: { code: @attribute_master.code, definition: @attribute_master.definition, name: @attribute_master.name, status: @attribute_master.status }
    assert_redirected_to attribute_master_path(assigns(:attribute_master))
  end

  test "should destroy attribute_master" do
    assert_difference('AttributeMaster.count', -1) do
      delete :destroy, id: @attribute_master
    end

    assert_redirected_to attribute_masters_path
  end
end
