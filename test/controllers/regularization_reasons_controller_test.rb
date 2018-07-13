require 'test_helper'

class RegularizationReasonsControllerTest < ActionController::TestCase
  setup do
    @regularization_reason = regularization_reasons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:regularization_reasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create regularization_reason" do
    assert_difference('RegularizationReason.count') do
      post :create, regularization_reason: { code: @regularization_reason.code, description: @regularization_reason.description, name: @regularization_reason.name, status: @regularization_reason.status }
    end

    assert_redirected_to regularization_reason_path(assigns(:regularization_reason))
  end

  test "should show regularization_reason" do
    get :show, id: @regularization_reason
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @regularization_reason
    assert_response :success
  end

  test "should update regularization_reason" do
    patch :update, id: @regularization_reason, regularization_reason: { code: @regularization_reason.code, description: @regularization_reason.description, name: @regularization_reason.name, status: @regularization_reason.status }
    assert_redirected_to regularization_reason_path(assigns(:regularization_reason))
  end

  test "should destroy regularization_reason" do
    assert_difference('RegularizationReason.count', -1) do
      delete :destroy, id: @regularization_reason
    end

    assert_redirected_to regularization_reasons_path
  end
end
