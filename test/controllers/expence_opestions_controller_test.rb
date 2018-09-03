require 'test_helper'

class ExpenceOpestionsControllerTest < ActionController::TestCase
  setup do
    @expence_opestion = expence_opestions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expence_opestions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expence_opestion" do
    assert_difference('ExpenceOpestion.count') do
      post :create, expence_opestion: { code: @expence_opestion.code, description: @expence_opestion.description, employee_grade_id: @expence_opestion.employee_grade_id, name: @expence_opestion.name, status: @expence_opestion.status }
    end

    assert_redirected_to expence_opestion_path(assigns(:expence_opestion))
  end

  test "should show expence_opestion" do
    get :show, id: @expence_opestion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expence_opestion
    assert_response :success
  end

  test "should update expence_opestion" do
    patch :update, id: @expence_opestion, expence_opestion: { code: @expence_opestion.code, description: @expence_opestion.description, employee_grade_id: @expence_opestion.employee_grade_id, name: @expence_opestion.name, status: @expence_opestion.status }
    assert_redirected_to expence_opestion_path(assigns(:expence_opestion))
  end

  test "should destroy expence_opestion" do
    assert_difference('ExpenceOpestion.count', -1) do
      delete :destroy, id: @expence_opestion
    end

    assert_redirected_to expence_opestions_path
  end
end
