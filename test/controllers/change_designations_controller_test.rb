require 'test_helper'

class ChangeDesignationsControllerTest < ActionController::TestCase
  setup do
    @change_designation = change_designations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:change_designations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create change_designation" do
    assert_difference('ChangeDesignation.count') do
      post :create, change_designation: { change_by_id: @change_designation.change_by_id, effective_from: @change_designation.effective_from, effective_to: @change_designation.effective_to, employee_designation_id: @change_designation.employee_designation_id, employee_id: @change_designation.employee_id, status: @change_designation.status }
    end

    assert_redirected_to change_designation_path(assigns(:change_designation))
  end

  test "should show change_designation" do
    get :show, id: @change_designation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @change_designation
    assert_response :success
  end

  test "should update change_designation" do
    patch :update, id: @change_designation, change_designation: { change_by_id: @change_designation.change_by_id, effective_from: @change_designation.effective_from, effective_to: @change_designation.effective_to, employee_designation_id: @change_designation.employee_designation_id, employee_id: @change_designation.employee_id, status: @change_designation.status }
    assert_redirected_to change_designation_path(assigns(:change_designation))
  end

  test "should destroy change_designation" do
    assert_difference('ChangeDesignation.count', -1) do
      delete :destroy, id: @change_designation
    end

    assert_redirected_to change_designations_path
  end
end
