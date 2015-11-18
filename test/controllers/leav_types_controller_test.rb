require 'test_helper'

class LeavTypesControllerTest < ActionController::TestCase
  setup do
    @leav_type = leav_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leav_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leav_type" do
    assert_difference('LeavType.count') do
      post :create, leav_type: { leave_expiry_date: @leav_type.leave_expiry_date, leave_type: @leav_type.leave_type, no_of_leave: @leav_type.no_of_leave }
    end

    assert_redirected_to leav_type_path(assigns(:leav_type))
  end

  test "should show leav_type" do
    get :show, id: @leav_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leav_type
    assert_response :success
  end

  test "should update leav_type" do
    patch :update, id: @leav_type, leav_type: { leave_expiry_date: @leav_type.leave_expiry_date, leave_type: @leav_type.leave_type, no_of_leave: @leav_type.no_of_leave }
    assert_redirected_to leav_type_path(assigns(:leav_type))
  end

  test "should destroy leav_type" do
    assert_difference('LeavType.count', -1) do
      delete :destroy, id: @leav_type
    end

    assert_redirected_to leav_types_path
  end
end
