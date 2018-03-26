require 'test_helper'

class PolicyTypesControllerTest < ActionController::TestCase
  setup do
    @policy_type = policy_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:policy_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create policy_type" do
    assert_difference('PolicyType.count') do
      post :create, policy_type: { code: @policy_type.code, description: @policy_type.description, is_active: @policy_type.is_active, name: @policy_type.name }
    end

    assert_redirected_to policy_type_path(assigns(:policy_type))
  end

  test "should show policy_type" do
    get :show, id: @policy_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @policy_type
    assert_response :success
  end

  test "should update policy_type" do
    patch :update, id: @policy_type, policy_type: { code: @policy_type.code, description: @policy_type.description, is_active: @policy_type.is_active, name: @policy_type.name }
    assert_redirected_to policy_type_path(assigns(:policy_type))
  end

  test "should destroy policy_type" do
    assert_difference('PolicyType.count', -1) do
      delete :destroy, id: @policy_type
    end

    assert_redirected_to policy_types_path
  end
end
