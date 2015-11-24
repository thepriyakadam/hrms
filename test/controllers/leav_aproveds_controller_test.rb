require 'test_helper'

class LeavAprovedsControllerTest < ActionController::TestCase
  setup do
    @leav_aproved = leav_aproveds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leav_aproveds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leav_aproved" do
    assert_difference('LeavAproved.count') do
      post :create, leav_aproved: { approved_date: @leav_aproved.approved_date, employee_leav_request_id: @leav_aproved.employee_leav_request_id }
    end

    assert_redirected_to leav_aproved_path(assigns(:leav_aproved))
  end

  test "should show leav_aproved" do
    get :show, id: @leav_aproved
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leav_aproved
    assert_response :success
  end

  test "should update leav_aproved" do
    patch :update, id: @leav_aproved, leav_aproved: { approved_date: @leav_aproved.approved_date, employee_leav_request_id: @leav_aproved.employee_leav_request_id }
    assert_redirected_to leav_aproved_path(assigns(:leav_aproved))
  end

  test "should destroy leav_aproved" do
    assert_difference('LeavAproved.count', -1) do
      delete :destroy, id: @leav_aproved
    end

    assert_redirected_to leav_aproveds_path
  end
end
