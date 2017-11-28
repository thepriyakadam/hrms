require 'test_helper'

class OtherSalaryComponentsControllerTest < ActionController::TestCase
  setup do
    @other_salary_component = other_salary_components(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:other_salary_components)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create other_salary_component' do
    assert_difference('OtherSalaryComponent.count') do
      post :create, other_salary_component: { code: @other_salary_component.code, description: @other_salary_component.description, is_deducted: @other_salary_component.is_deducted, name: @other_salary_component.name }
    end

    assert_redirected_to other_salary_component_path(assigns(:other_salary_component))
  end

  test 'should show other_salary_component' do
    get :show, id: @other_salary_component
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @other_salary_component
    assert_response :success
  end

  test 'should update other_salary_component' do
    patch :update, id: @other_salary_component, other_salary_component: { code: @other_salary_component.code, description: @other_salary_component.description, is_deducted: @other_salary_component.is_deducted, name: @other_salary_component.name }
    assert_redirected_to other_salary_component_path(assigns(:other_salary_component))
  end

  test 'should destroy other_salary_component' do
    assert_difference('OtherSalaryComponent.count', -1) do
      delete :destroy, id: @other_salary_component
    end

    assert_redirected_to other_salary_components_path
  end
end
