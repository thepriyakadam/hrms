require 'test_helper'

class ComplianceTypesControllerTest < ActionController::TestCase
  setup do
    @compliance_type = compliance_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:compliance_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compliance_type" do
    assert_difference('ComplianceType.count') do
      post :create, compliance_type: { code: @compliance_type.code, description: @compliance_type.description, name: @compliance_type.name, status: @compliance_type.status }
    end

    assert_redirected_to compliance_type_path(assigns(:compliance_type))
  end

  test "should show compliance_type" do
    get :show, id: @compliance_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @compliance_type
    assert_response :success
  end

  test "should update compliance_type" do
    patch :update, id: @compliance_type, compliance_type: { code: @compliance_type.code, description: @compliance_type.description, name: @compliance_type.name, status: @compliance_type.status }
    assert_redirected_to compliance_type_path(assigns(:compliance_type))
  end

  test "should destroy compliance_type" do
    assert_difference('ComplianceType.count', -1) do
      delete :destroy, id: @compliance_type
    end

    assert_redirected_to compliance_types_path
  end
end
