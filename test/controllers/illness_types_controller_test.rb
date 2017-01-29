require 'test_helper'

class IllnessTypesControllerTest < ActionController::TestCase
  setup do
    @illness_type = illness_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:illness_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create illness_type" do
    assert_difference('IllnessType.count') do
      post :create, illness_type: { code: @illness_type.code, description: @illness_type.description, name: @illness_type.name }
    end

    assert_redirected_to illness_type_path(assigns(:illness_type))
  end

  test "should show illness_type" do
    get :show, id: @illness_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @illness_type
    assert_response :success
  end

  test "should update illness_type" do
    patch :update, id: @illness_type, illness_type: { code: @illness_type.code, description: @illness_type.description, name: @illness_type.name }
    assert_redirected_to illness_type_path(assigns(:illness_type))
  end

  test "should destroy illness_type" do
    assert_difference('IllnessType.count', -1) do
      delete :destroy, id: @illness_type
    end

    assert_redirected_to illness_types_path
  end
end
