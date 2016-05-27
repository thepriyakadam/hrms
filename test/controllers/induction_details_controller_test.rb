require 'test_helper'

class InductionDetailsControllerTest < ActionController::TestCase
  setup do
    @induction_detail = induction_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:induction_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create induction_detail" do
    assert_difference('InductionDetail.count') do
      post :create, induction_detail: { employee_id: @induction_detail.employee_id, induction_completed: @induction_detail.induction_completed, induction_master_id: @induction_detail.induction_master_id, start_date: @induction_detail.start_date }
    end

    assert_redirected_to induction_detail_path(assigns(:induction_detail))
  end

  test "should show induction_detail" do
    get :show, id: @induction_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @induction_detail
    assert_response :success
  end

  test "should update induction_detail" do
    patch :update, id: @induction_detail, induction_detail: { employee_id: @induction_detail.employee_id, induction_completed: @induction_detail.induction_completed, induction_master_id: @induction_detail.induction_master_id, start_date: @induction_detail.start_date }
    assert_redirected_to induction_detail_path(assigns(:induction_detail))
  end

  test "should destroy induction_detail" do
    assert_difference('InductionDetail.count', -1) do
      delete :destroy, id: @induction_detail
    end

    assert_redirected_to induction_details_path
  end
end
