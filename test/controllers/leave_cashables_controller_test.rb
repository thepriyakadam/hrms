require 'test_helper'

class LeaveCashablesControllerTest < ActionController::TestCase
  setup do
    @leave_cashable = leave_cashables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_cashables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leave_cashable" do
    assert_difference('LeaveCashable.count') do
      post :create, leave_cashable: { amount: @leave_cashable.amount, cashable: @leave_cashable.cashable, date: @leave_cashable.date, employee_id: @leave_cashable.employee_id, is_confirm: @leave_cashable.is_confirm, leav_category_id: @leave_cashable.leav_category_id, no_of_leave: @leave_cashable.no_of_leave }
    end

    assert_redirected_to leave_cashable_path(assigns(:leave_cashable))
  end

  test "should show leave_cashable" do
    get :show, id: @leave_cashable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leave_cashable
    assert_response :success
  end

  test "should update leave_cashable" do
    patch :update, id: @leave_cashable, leave_cashable: { amount: @leave_cashable.amount, cashable: @leave_cashable.cashable, date: @leave_cashable.date, employee_id: @leave_cashable.employee_id, is_confirm: @leave_cashable.is_confirm, leav_category_id: @leave_cashable.leav_category_id, no_of_leave: @leave_cashable.no_of_leave }
    assert_redirected_to leave_cashable_path(assigns(:leave_cashable))
  end

  test "should destroy leave_cashable" do
    assert_difference('LeaveCashable.count', -1) do
      delete :destroy, id: @leave_cashable
    end

    assert_redirected_to leave_cashables_path
  end
end
