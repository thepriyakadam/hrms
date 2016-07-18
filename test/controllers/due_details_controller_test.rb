require 'test_helper'

class DueDetailsControllerTest < ActionController::TestCase
  setup do
    @due_detail = due_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:due_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create due_detail" do
    assert_difference('DueDetail.count') do
      post :create, due_detail: { due_employee_template_id: @due_detail.due_employee_template_id, reporting_master_id: @due_detail.reporting_master_id, status: @due_detail.status }
    end

    assert_redirected_to due_detail_path(assigns(:due_detail))
  end

  test "should show due_detail" do
    get :show, id: @due_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @due_detail
    assert_response :success
  end

  test "should update due_detail" do
    patch :update, id: @due_detail, due_detail: { due_employee_template_id: @due_detail.due_employee_template_id, reporting_master_id: @due_detail.reporting_master_id, status: @due_detail.status }
    assert_redirected_to due_detail_path(assigns(:due_detail))
  end

  test "should destroy due_detail" do
    assert_difference('DueDetail.count', -1) do
      delete :destroy, id: @due_detail
    end

    assert_redirected_to due_details_path
  end
end
