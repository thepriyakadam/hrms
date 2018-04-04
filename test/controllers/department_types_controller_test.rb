require 'test_helper'

class DepartmentTypesControllerTest < ActionController::TestCase
  setup do
    @department_type = department_types(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:department_types)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create department_type' do
    assert_difference('DepartmentType.count') do
      post :create, department_type: { name: @department_type.name }
    end

    assert_redirected_to department_type_path(assigns(:department_type))
  end

  test 'should show department_type' do
    get :show, id: @department_type
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @department_type
    assert_response :success
  end

  test 'should update department_type' do
    patch :update, id: @department_type, department_type: { name: @department_type.name }
    assert_redirected_to department_type_path(assigns(:department_type))
  end

  test 'should destroy department_type' do
    assert_difference('DepartmentType.count', -1) do
      delete :destroy, id: @department_type
    end

    assert_redirected_to department_types_path
  end
end
