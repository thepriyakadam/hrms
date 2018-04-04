require 'test_helper'

class LeavingReasonsControllerTest < ActionController::TestCase
  setup do
    @leaving_reason = leaving_reasons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leaving_reasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leaving_reason" do
    assert_difference('LeavingReason.count') do
      post :create, leaving_reason: { code: @leaving_reason.code, description: @leaving_reason.description, name: @leaving_reason.name }
    end

    assert_redirected_to leaving_reason_path(assigns(:leaving_reason))
  end

  test "should show leaving_reason" do
    get :show, id: @leaving_reason
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leaving_reason
    assert_response :success
  end

  test "should update leaving_reason" do
    patch :update, id: @leaving_reason, leaving_reason: { code: @leaving_reason.code, description: @leaving_reason.description, name: @leaving_reason.name }
    assert_redirected_to leaving_reason_path(assigns(:leaving_reason))
  end

  test "should destroy leaving_reason" do
    assert_difference('LeavingReason.count', -1) do
      delete :destroy, id: @leaving_reason
    end

    assert_redirected_to leaving_reasons_path
  end
end
